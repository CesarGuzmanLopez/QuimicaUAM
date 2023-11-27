export interface Molecule {
  id: number;
  Name: string;
  RIS: string;
  SMILE: string;
  Imagen: string;
  Description?: string | null;
  Active: string;
  created_at?: null;
  updated_at?: null;
}
export interface KOverall {
  ID_K_OVERALL: number;
  ID_Molecule: number;
  radical: number;
  Solvent: number;
  Valor: string;
  pH?: string | null;
  Tipo: string;
  Descripcion?: string | null;
  ID_Alta?: number | null;
  id_reference?: null;
}
export interface Solventes {
  ID_Solvent: number;
  Name_Solvent: string;
  Description?: string | null;
  ID_Alta?: number | null;
  created_at?: null;
  updated_at?: null;
}
export interface Referecias {
  id_reference: number;
  Reference: string;
  Coments?: string | null;
  created_at?: null;
  updated_at?: null;
}
export interface Radicals {
  ID_Radical: number;
  Name_Radical: string;
  Description?: null;
  ID_Alta: number;
  created_at?: null;
  updated_at?: null;
}
