import csv
import numpy as np
from sklearn.manifold import TSNE
import pandas as pd

# Read the vectors from the CSV file
vectors = []
with open('intermediate_data/deidentified_beans.csv', 'r') as f:
    reader = csv.reader(f)
    n = 1
    for row in reader:
        if n != 1:
            vectors.append([float(x) for x in row])
        n = n + 1

# Convert to NumPy array
vectors = np.array(vectors)

# Apply t-SNE
tsne = TSNE(n_components=2, random_state=0)
vectors_tsne = tsne.fit_transform(vectors)

# Save the 2D projections to a new CSV file
df = pd.DataFrame(vectors_tsne, columns=['TSNE1', 'TSNE2'])
df.to_csv('intermediate_data/tsne-projection.csv', index=False)