z_latent = np.expand_dims(np.random.normal(0,1,2), axis=0)
x_generate = decoder.predict(z_latent)
plt.imshow(x_generate[0].reshape(28, 28))