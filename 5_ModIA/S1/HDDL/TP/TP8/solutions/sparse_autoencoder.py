sparse_encoded_imgs = sparse_encoder.predict(x_test)
encoded_imgs = encoder.predict(x_test)

fig = plt.figure(figsize=(15,5))

ax = fig.add_subplot(1,2,1)
ax.hist(np.sum(encoded_imgs==0,axis=1), width=0.9, bins=np.arange(-0.5,10.5,1))
ax.set_xticks(np.arange(10))
ax.set_title("Simple autoencoder")

ax = fig.add_subplot(1,2,2)
ax.hist(np.sum(sparse_encoded_imgs==0,axis=1), width=0.9, bins=np.arange(-0.5,10.5,1))
ax.set_xticks(np.arange(10))
ax.set_title("Sparse autoencoder")

plt.show()