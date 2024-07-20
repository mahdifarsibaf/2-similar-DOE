import pandas as pd


def is_similar_exact(row1, row2, fill_value=None):
  """
  Checks if all corresponding elements in two rows are equal for the same columns.

  Args:
      row1 (pandas.Series): A row from the first DataFrame.
      row2 (pandas.Series): A row from the second DataFrame.
      fill_value (object, optional): The value to use for filling missing values.
                                    Defaults to None.

  Returns:
      bool: True if all elements are equal, False otherwise.
  """

  common_cols = set(row1.index) & set(row2.index)

 
  if fill_value is not None:
      row1 = row1.fillna(fill_value)
      row2 = row2.fillna(fill_value)


  return all(row1[col] == row2[col] for col in common_cols)



waam = pd.read_excel('waam.xlsx')
poldaghi = pd.read_excel('poldaghi.xlsx')


similar_rows = []
for row_index1, row1 in waam.iterrows():
  for row_index2, row2 in poldaghi.iterrows():
    similarity_score = is_similar_exact(row1, row2)
    if similarity_score:
    
      similar_row_waam = waam.iloc[row_index1]
      similar_row_poldaghi = poldaghi.iloc[row_index2]
      similar_rows.append((row1.index.tolist(), row2.index.tolist(), similar_row_waam, similar_row_poldaghi, similarity_score))



df_similar_rows = pd.DataFrame(similar_rows, 
                              columns=['waam_cols', 'poldaghi_cols', 'waam_row', 'poldaghi_row', 'similarity_score'])


df_similar_rows = df_similar_rows.sort_values(by='similarity_score', ascending=False)


top_n_similar = df_similar_rows.head(6)


for index, row in top_n_similar.iterrows():
  print(f"Similarity Score: {row['similarity_score']}")
  print(f"Columns from waam.xlsx: {row['waam_cols']}")
  print(row['waam_row'])
  print(f"Columns from poldaghi.xlsx: {row['poldaghi_cols']}")
  print(row['poldaghi_row'])
  print("-" * 50)
