/-  collections
/+  colls
/=  gas  /$  fuel:html
/=  configs  /:  /===/web/collections
             /^  (map knot config:collections)  /_  /collections-config/
:: tried to pull this func into a lib, but couldn't get the gill working correctly. grr.
/=  topic  /;  |=  a/(map knot topicful:collections)
               ^-  (pair knot topicful:collections)
               =/  sa  
               %+  sort
                 ~(tap by a)
               |=  [b=(pair knot *) c=(pair knot *)]
               (gth (unt:chrono:userlib (slav %da p.b)) (unt:chrono:userlib (slav %da p.c)))
               ?~  sa
                 *(pair knot topicful:collections)
               i.sa
           /:  /%%/
           /^  (map knot topicful:collections)  /_  /collections-topic-full/
/=  content  /;  |=  a/(map knot manx)
               ^-  (pair knot manx)
               =/  sa  
               %+  sort
                 ~(tap by a)
               |=  [b=(pair knot *) c=(pair knot *)]
               (gth (unt:chrono:userlib (slav %da p.b)) (unt:chrono:userlib (slav %da p.c)))
               ?~  sa
                 *(pair knot manx)
               i.sa
             /:  /%%/
             /^  (map knot manx)  /_
             /&elem&md&/collections-topic/
=/  config  (~(get by configs) +<:s.bem.gas)
::
=,  old-zuse
^-  manx
;div.post
  ;div.topic-info.mb-4
    ;div.row.coll-title
      ;a(href "/~~/collections/{(trip +<:s.bem.gas)}")
        {(trip desc:(need config))} /
      ==
    ==
    ;div.row.mod.text-mono
      ; {(trip p.topic)}
    ==
  ==
  ::
  ;div#show
    ;div.row.tit
      ;h1: {(trip tit.info.q.topic)}
    ==
    ;*  ?:  (authed:colls gas)
          ;=
            ;a(href "/~~/collections/{(trip +<:s.bem.gas)}/{(trip p.topic)}.collections-edit")
              ;button#edit-btn.btn.btn-primary.mb-4
                ; Edit →
              ==
            ==
          ==
        ;=
          ;div(urb-component "Subscribe", urb-circle "{(scow %p p.bem.gas)}/collection_~{(trip +<:s.bem.gas)}_~{(trip p.topic)}");
        ==
    ;div.row.content.mb-18
      +{q.content}
    ==
    ;*  ?:  comm:(need config)
      ;=
        ;div.coms
          ;h3: Comments
            ;ol
              ;*  %+  turn
                    %+  sort
                      ~(tap by coms.q.topic)
                    |=  [a=[c=@da d=[mod=@da who=@p wat=wain]] b=[c=@da d=[mod=@da who=@p wat=wain]]]
                    (lth (unt:chrono:userlib c.a) (unt:chrono:userlib c.b))
                    ::
                  |=  [c=@da d=[mod=@da who=@p wat=wain]]
                  ;li
                    ;div.da.text-mono.ml-12(urb-component "Elapsed", urb-timestring "{(esoo:colls mod.d)}");
                    ;div.com.ml-12.mb-6
                      ;div.who.text-mono
                        ;a(href "")
                          {(trip (scot %p who.d))}
                        ==
                      ==
                      ;div.com-body
                        ; {(trip (of-wain:format wat.d))}
                      ==
                    ==
                  ==
            ==
            ;div.ml-12(urb-component "CommentCreate", urb-coll "{(trip +<:s.bem.gas)}", urb-top "{(trip p.topic)}");
        ==
      ==
    ~
  ==
==