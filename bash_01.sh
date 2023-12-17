URL=https://api.coindcx.com/exchange/ticker
echo -n "Enter bitcoin Symbol : "
read btc
btc="${btc^^}"

curl -s $URL | jq '.[] | {ticker: .market,price: .last_price}' | jq -r '.ticker +  " -- " + .price' | grep -w "$btc"

 
if [ ! $? -eq 0 ]; then
     curl -s $URL | jq '.[] | {ticker: .market,price: .last_price}' | jq -r '.ticker +  " -- " + .price' | grep  "$btc"
fi

if [ ! $? -eq 0 ]; then
    echo "$btc is not found!"
fi
