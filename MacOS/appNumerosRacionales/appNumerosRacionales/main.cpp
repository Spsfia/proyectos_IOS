//
//  main.cpp
//  appNumerosRacionales
//
//  Created by Martin Oswaldo Valdes 
//

#include <iostream>
using namespace std;

//IMPLEMENTAR UNA CLASE PARA EL TIPO DE DATO RACIONAL
struct Racional{
int num, den;
};

Racional suma(Racional x, Racional y);
Racional multiplicacion(Racional x, Racional y);
Racional division(Racional x, Racional y);
void escribir(Racional x);

int main()
{
    Racional r1, r2, r3;
    cout<<"NUMEROS RACIONALES O FRACCIONES "<<endl;
    cout << "Primer Numero Racional\n";
    cout << "\nNumerador: ";
    cin >> r1.num;
    cout << "\nDenominador: ";
    cin >> r1.den;
    cout << "\nSegundo Numero Racional\n";
    cout << "\nIntroduce el numerador: ";
    cin >> r2.num;
    cout << "\nIntroduce el denominador: ";
    cin >> r2.den;
    r3=suma(r1,r2);
    cout << "\nLa suma es el numero ";
    escribir (r3);
    r3=multiplicacion(r1,r2);
    cout <<"\n\nLa multiplicacion es el numero ";
    escribir (r3);
    r3=division(r1,r2);
    cout <<"\n\nLa division es el numero ";
    escribir (r3);
    
}

Racional suma(Racional x, Racional y)
{
    Racional c;
    
    c.num=x.num*y.den+x.den*y.num;
    c.den=x.den*y.den;

    return c;

}

Racional multiplicacion(Racional x, Racional y)
{
    Racional c;
    c.num=x.num*y.num;
    c.den=x.den*y.den;

    return c;

}

Racional division(Racional x, Racional y)
{
    Racional c;
    c.num=x.num*y.den;
    c.den=x.den*y.num;

    return c;

}

void escribir(Racional c)
{
    cout<<endl<<c.num<<"/"<<c.den<<endl;
    double resul = (double)c.num/c.den;
    cout<<"Resultado = "<<resul<<endl;
    
}
