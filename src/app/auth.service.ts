import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }
  url = 'http://localhost/mandaditos/';

  login(email: string, password: string) {
    return this.http.post<any>(this.url + 'login.php', { email, password });
  }
  per(Id:number){
    return this.http.post<any>(this.url + 'perfil.php', { Id });
  }
}
