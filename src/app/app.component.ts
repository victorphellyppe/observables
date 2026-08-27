import { Component, OnInit  } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FormsModule } from '@angular/forms';  // 👈 faltando isso
import { Observable } from 'rxjs';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, FormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements OnInit  {
  title = 'obeservables';
  
  inputProduto: string = '';
  // inicio a promise
  // private timer = new Promise<string>((resolver, reject)=> {
  //   console.log('Promise iniciada');  
  //   setTimeout(() => {
  //     resolver("Resolvido a promise")
  //   }, 2000)
  // })

  // Observable
  private timer$ = new Observable<string>(sub => {
   console.log('Observable iniciada');  

    setTimeout(() => {
      sub.next("Resolvido observable")
    }, 2000)
  })


  ngOnInit() {
    //uso a promise e resolvo e ela morre
    // this.timer.then((value) => {
    //   console.log(value);
    // })

    this.timer$.subscribe((value) => {
      console.log(value);
      // mostra o next mas fica na memoria do computador
    })
  }

  addProduto(){



    this.inputProduto = '';
  }
}
