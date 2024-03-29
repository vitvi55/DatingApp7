import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { OnSameUrlNavigation } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  title = 'Dating app';
  users: any;

  constructor(private http: HttpClient) {}

  ngOnInit(): void {
    this.http.get('https://localhost:5001/api/users').subscribe({
      next: response => 
      {
        this.users = response;
        console.log(response);
      },
      error: error => console.log (error),
      complete: () => console.log('Request has complated')
    })
  
}
  }



