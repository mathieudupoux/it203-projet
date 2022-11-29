export type Game = {
    numero_jeu: number,
    nom: string,
    editeur: string,
    date_de_parution: Date,
    type_de_jeu: string,
    duree: number,
    numero_mecanique: number | null,
    mecanisme: string | null,
    numero_theme: number | null,
    theme: string | null
}