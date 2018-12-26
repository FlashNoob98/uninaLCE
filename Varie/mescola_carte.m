%script per calcolare numero di tentativi necessari ad estrarre n carte di fila minori di 6
%su 40 carte, 20 sono minori di 6 quindi si assumono i numeri da 1 a 20 equivalenti a quelle carte
%si può inserire il commento nell'if per stabilire quante carte estrarre di fila
count=0;
A=randperm(40);
esci=0;
somma=0;
totale=1000;
for k=1:totale
  while esci!=1;
    A=randperm(40); %mescola carte
    count=count+1;
    if (A(1)<=20)&&(A(2)<=20)&&(A(3)<=20)&&(A(4)<=20)&&(A(5)<=20)&&(A(6)<=20)%&&(A(7)<=20)&&(A(8)<=20)&&(A(9)<=20)&&(A(10)<=20)&&(A(11)<=20)&&(A(12)<=20)&&(A(13)<=20)&&(A(14)<=20)&&(A(15)<=20)&&(A(16)<=20)&&(A(17)<=20)&&(A(18)<=20)&&(A(19)<=20)&&(A(20)<=20)
      esci=1;
      %fprintf ("\nHai vinto dopo %d tentativi :)\n",count);
      %fprintf ("Ecco i tuoi numeri: \n");
      %for i=1:6
        %fprintf("%d ",B(i));
      %end
      %fprintf("\n");
    end
end
somma=somma+count;
esci=0;
count=0;
end
media=somma/totale;
fprintf("Media tentativi necessari: %d\n",media);
fprintf("Probabilità: %3.3d %%\n",100/media);
