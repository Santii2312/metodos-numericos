function ret = biseccion(a, b, str_fun)

    fx = inline(str_fun);

    if (fx(a)*fx(b))<0

      mn_anterior = -100;
      error = 1;
      fprintf("%s\t%s\t%s\t%s\t%s\t%s\t\%s\t\%s\t\n", "i", "a", "b", "Mn", "f(a)", "f(Mn)", "f(a)*f(Mn)", "error %")

      for i = 1:20

          Mn = formula_biseccion(a, b);

          fprintf("%d\t", i)
          fprintf("%.4f\t", a)
          fprintf("%.4f\t", b)
          fprintf("%.4f\t", Mn)
          fprintf("%.4f\t", fx(a))
          fprintf("%.4f\t", fx(Mn))

          if fx(a) * fx(Mn) < 0
              b = (Mn);
          elseif
              a = (Mn);
          endif

          fprintf("%.4f\t", fx(a) * fx(Mn))

          ## Calcular error
          if mn_anterior == -100
              mn_anterior = Mn;
          else
              error = abs((Mn - mn_anterior) / Mn);
              mn_anterior = Mn;
          endif

          ## mostrat error
          fprintf("\t", error * 100)
          fprintf("%.4f\t\t", error * 100)

          fprintf("\n")

      endfor

    else
      msg_error = "No se puede realizar el metodo de biseccion con los datos ingresados";
      disp("No se puede realizar el metodo de biseccion con los datos ingresados");
      questdlg (strcat("ERROR\n","No se puede realizar el metodo de biseccion con los datos ingresados"), "ERROR");
    endif

end

function ret = formula_biseccion(a, b)
    ## Esta es la formula para mn
    ret = (a + b) / 2;
end
