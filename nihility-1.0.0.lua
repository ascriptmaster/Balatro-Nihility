--- STEAMODDED HEADER
--- MOD_NAME: Nihility Challenge
--- MOD_ID: NihilityChallenge
--- MOD_AUTHOR: [ascriptmaster]
--- MOD_DESCRIPTION: A mod that adds the Nihility Challenge Deck to the game Balatro, in which all cards are debuffed.

----------------------------------------------
------------MOD CODE -------------------------

-- Insert challenge
local challenges = G.CHALLENGES
table.insert(G.CHALLENGES,1,{
    name = 'Nihility',
    id = 'c_mod_nihility',
    rules = {
        custom = {
            {id = 'debuff_all'}
        },
        modifiers = {
            {id = 'dollars', value = 8},
        }
    },
    jokers = {
        {id = 'j_joker'}
    },
    consumeables = {},
    vouchers = {
    },
    deck = {
        type = 'Challenge Deck',
    },
    restrictions = {
        banned_cards = {
            {id = 'j_8_ball'},
            {id = 'j_ancient'},
            {id = 'j_arrowhead'},
            {id = 'j_baron'},
            {id = 'j_bloodstone'},
            {id = 'j_business'},
            {id = 'j_castle'},
            {id = 'j_dusk'},
            {id = 'j_even_steven'},
            {id = 'j_faceless'},
            {id = 'j_fibonacci'},
            {id = 'j_gluttenous_joker'},
            {id = 'j_greedy_joker'},
            {id = 'j_hack'},
            {id = 'j_hanging_chad'},
            {id = 'j_hiker'},
            {id = 'j_hit_the_road'},
            {id = 'j_idol'},
            {id = 'j_lusty_joker'},
            {id = 'j_mail'},
            {id = 'j_midas_mask'},
            {id = 'j_mime'},
            {id = 'j_odd_todd'},
            {id = 'j_onyx_agate'},
            {id = 'j_pareidolia'},
            {id = 'j_photograph'},
            {id = 'j_raised_fist'},
            {id = 'j_reserved_parking'},
            {id = 'j_rough_gem'},
            {id = 'j_scary_face'},
            {id = 'j_scholar'},
            {id = 'j_seeing_double'},
            {id = 'j_selzer'},
            {id = 'j_shoot_the_moon'},
            {id = 'j_smiley'},
            {id = 'j_sock_and_buskin'},
            {id = 'j_splash'},
            {id = 'j_ticket'},
            {id = 'j_triboulet'},
            {id = 'j_vampire'},
            {id = 'j_walkie_talkie'},
            {id = 'j_wee'},
            {id = 'j_wrathful_joker'},
        },
        banned_tags = {
        },
        banned_other = {
            {id = 'bl_club', type = 'blind'},
            {id = 'bl_goad', type = 'blind'},
            {id = 'bl_head', type = 'blind'},
            {id = 'bl_plant', type = 'blind'},
            {id = 'bl_window', type = 'blind'},
            {id = 'bl_pillar', type = 'blind'},
            {id = 'bl_final_leaf', type = 'blind'},
        }
    }
})

-- Localization
function SMODS.current_mod.process_loc_text()
    G.localization.misc.challenge_names.c_mod_nihility = "Nihility"
    G.localization.misc.v_text.ch_c_debuff_all = {"ALL cards are debuffed"}
end

-- Inject debuff enforcement
local Blind_debuff_card_ref = Blind.debuff_card
function Blind:debuff_card(card, from_blind)
    if G.GAME.challenge == "c_mod_nihility" and card and card.area ~= G.jokers then
        card:set_debuff(true)
        return
    end
    return Blind_debuff_card_ref(self, card, from_blind)
end

----------------------------------------------
------------MOD CODE END----------------------