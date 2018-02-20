Quote <<"/home/deploy/.rbenv/versions/2.2.1/bin/ruby -s ~/peatio/pc/api.rb" << " " << FirstThree << LastThree << " " << qeQuoteAskSize << " " << "sell" << " " << qeQuoteAskPrice;
          const string quote = Quote.str().c_str();
          cout << "Quote parameters: " << quote << endl;
          system(quote);