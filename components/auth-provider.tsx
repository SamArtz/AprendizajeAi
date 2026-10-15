'use client';
import { createContext, useContext } from 'react';
import type { PublicUser } from '../lib/auth-types';
const Context=createContext<{user:PublicUser|null}>({user:null});
export function AuthProvider({user,children}:{user:PublicUser|null;children:React.ReactNode}) { return <Context.Provider value={{user}}>{children}</Context.Provider>; }
export const useAuth=()=>useContext(Context);
