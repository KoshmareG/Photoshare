module ApplicationHelper
    def declension count
        if (count % 100 >= 11 && count % 100 <= 14) || (count % 10 == 0) || (count % 10 >= 5 && count % 10 <= 9)
            "third"
        elsif count % 10 == 1
            "first"
        else
            "second"
        end
    end

    def separator item
        item.digits(1000).reverse.join(",")
    end
end
