# build decoder model
latent_inputs = kl.Input(shape=(latent_dim,), name='z_sampling')
x = kl.Dense(intermediate_dim, activation='relu')(latent_inputs)
outputs = kl.Dense(input_dim, activation='sigmoid')(x)

# instantiate decoder model
decoder = km.Model(latent_inputs, outputs, name='decoder')
decoder.summary()