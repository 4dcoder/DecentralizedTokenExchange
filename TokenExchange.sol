    
    ////////////////////////////////////////////
    ////////////////////// Share trading
    /*struct BuyOrSellOrder
    {
        bool isActive;
        bool isBuyOrder;
        address person;
        uint256 amountOfShares;
        uint256 totalPrice;
        uint256 approximatePricePerShare; // This value has been rounded up to the nearest wei
    }
    
    mapping(uint256 => BuyOrSellOrder[]) public pricesToBuySellOrders;
    uint256[] public buyOrderPrices; // sorted from highest price to lowest price
    uint256[] public sellOrderPrices; // sorted from lowest price to highest price
    
    function buySharesAtMarketPrice(uint256 amountOfSharesToBuy, uint256 maximumTotalPriceToPay) external payable
    {
        addressToBalance[msg.sender] += msg.value;
        
        uint256 totalPricePaidSoFar = 0;
        uint256 totalSharesBoughtSoFar = 0;
        
        uint256 previousBuyOrderPrice = 0;
        for (uint i=0; i<sellOrderPrices.length; i++)
        {
            uint256 currentPrice = sellOrderPrices[i];
            if (currentPrice == previousBuyOrderPrice) continue;
            
            for (uint j=0; j<pricesToBuySellOrders[i].length; j++)
            {
                BuyOrSellOrder storage order = pricesToBuySellOrders[i][j];
                if (order.isActive == false) continue; // skip all orders that have already been cancelled or filled
                if (order.isBuyOrder == true) continue; // we are buying, so we're only interested in sell orders
                
                // If we have to fill this entire sell order...
                if (order.amountOfShares <= (amountOfSharesToBuy - totalSharesBoughtSoFar))
                {
                    addressesToShareholderBalance[order.person] += order.totalPrice;
                    totalPricePaidSoFar += order.totalPrice;
                    totalSharesBoughtSoFar += order.amountOfShares;
                    order.isActive = false; // De-activate the order
                }
                
                // If we have to fill this sell order partially...
                else
                {
                    uint256 sharesToBuy = amountOfSharesToBuy - totalSharesBoughtSoFar;
                    uint256 priceToPay = sharesToBuy * order.approximatePricePerShare;
                    order.amountOfShares -= sharesToBuy;
                    order.totalPrice -= priceToPay;
                    totalPricePaidSoFar += priceToPay;
                    totalSharesBoughtSoFar += sharesToBuy;
                }
            }
            
            if (totalSharesBoughtSoFar == amountOfSharesToBuy) break;
            
            previousBuyOrderPrice = currentPrice;
        }
        
        assert(totalSharesBoughtSoFar == amountOfSharesToBuy);
        assert(totalPricePaidSoFar <= maximumTotalPriceToPay);
        assert(addressesToShareholderBalance[msg.sender] >= totalPricePaidSoFar);
        
        addressesToShareholderBalance[msg.sender] -= totalPricePaidSoFar;
        addressesToShares[msg.sender] += totalSharesBoughtSoFar;
    }
    
    function cancelOrder(bool isBuyOrder, uint256 priceIndex, uint256 index) public
    {
        BuyOrSellOrder[] storage orderArray;
        if (isBuyOrder)
        {
            assert(priceIndex < buyOrderPrices.length);
            orderArray = pricesToBuySellOrders[buyOrderPrices[priceIndex]];
        }
        else
        {
            assert(priceIndex < sellOrderPrices.length);
            orderArray = pricesToBuySellOrders[sellOrderPrices[priceIndex]];
        }
        
        assert(index < orderArray.length);
        BuyOrSellOrder storage order = orderArray[index];
        assert(order.person == msg.sender);
        assert(order.isBuyOrder == true);
        assert(order.isActive == true);
        addressToBalance[msg.sender] += order.totalPrice;
        order.isActive = false;
        
        // Clean-up
        while (orderArray.length >= 1 &&
               orderArray[orderArray.length-1].isActive == false)
        {
            orderArray.length--;
        }
    }*/
