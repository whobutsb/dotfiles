# Stripe

Updating Metadata 

    curl https://api.stripe.com/v1/customers/[customer_id] \ 
        -u [secret-key] \
        -d "metadata[account.name]=Account Name"
