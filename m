Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934589;
	b=XlIymwd9+gGK5eHYQ48P/sr0WT6rGQDqJOaXUsDVfo+48uMNhX8OlvVa8110DuTYPaxK
	 pUfwPoGNM1PPNzyDrDuLEu9vEKGrRzm50/deYZULQwCk6jXoj4icwmhcyf35v5loQPGcl
	 3JGaCbUFXdy6zQ2nl15tm8DEkfzO5/cb3I9bszlG6sUC7GyUw3sEbLyZ+HfH1B83IBfry
	 TCoxc7whrnpnVP1pzKIJCucArE6Q+YlUOXP+XI0H9w7TdQzrizfF3/9nlfyzlK9s5xC0o
	 5UDT6dTkUH6COtSBYJ0YDT7FEFolg379rzyZsqJB9nDWtWPb9MzRhckOe4j6ybxj4Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
	b=1OSROQ2D7aaJc2W5R5UwLSUrtwgFC8rxJYhrLC4lV3AZb9fhLxBBmY4BU7l5VnKH+0rq
	 9TAA3255nZAQ/uELC+w/QkIGsm1YZ98b4I7WvzhPzUfQw/m13jLgFTg/vuLoX16x3mJdm
	 Y+tOJEVmHJ7vlVYzO63GjLvVHopEWnE1k6GMscavu1wkvyW80FG8x4ZYSaA33B7ZrJMsF
	 qV5aTeiwvkIcRnCavZoC8qc9Lq1lmt3BiHlF3UR0z4Bsa8dI+/QXI2LihqHo4tReWYNlW
	 Sq/mYpINJDZ6CxkFgKchWN0/8BaDtQrUUtyZbz9fpneMSXYnfQIbTiUpKWQp64Pp6xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jPKsLWh1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D738606A31A
	for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 13:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D738606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jPKsLWh1
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c5e31bea9so2706846d6.1
        for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 06:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934587; cv=none;
        d=google.com; s=arc-20260327;
        b=KJIMF11m0QLXHrk/s43KIkCingQgTNmNr/5e3XoyJdAoG8CwZ+fId5v+hWlqDnZg1I
         4ATEmsqCNJLHowiJXxvhemMPse8a2AamioA/hFOxepo3lwZjFSn9y1ae1IfFO5ETLI6z
         uy6Q8taWwriz9UagAEKAEgXJ7EwQqUeolSWLnAv4xEIrgQoP6cgs2eiVFK2X7B+ZcO/2
         xQVqG6jvQGKIFuwvPQXs2ia9LTkiSmUds32WuZEQQIRjm8wCdlxjq/YtR9s1hoPoqI1R
         81zd6wi/Je7I9T9u8DzF9oW3LVHHZavJsYNA4QFpPCfSUuDupY88NTN5S4hvTIP30Gl1
         DiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
        fh=0OpZowphgha/OdMd7ma7mpymxE6aLOcCt30xMQBKvR0=;
        b=dqdyoUrEru40bYzGi5nT2wn4BorxNkVpL0a3nvz2taEGJ5VnDgEK5HLzgrTFKCWqFV
         jmBHRg0lnpU3idfYvbEfYu527zkoNjvbPsYTMjRMvj7NhofLV33YD4aV83PdqmqoyoE7
         puIPNsUTBKH5djfB+hvrvVxvb1i/fRDtvUDLLfVu0LFtCEVWjU5iStQ1wk+k/eyjZqAi
         o5BimONkEq1qPlCrzIeK3cO8b+U9t3/tD/csMBH7I0PLJ13XeI9GH8hq5XsM+0DomHNK
         YsVGqUVr2Giv0eSp/uPQzrSNNGCcRjjhm8WN74FXm570A081JPVqFt9LtQL28TElq4Z9
         DmFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934587; x=1793539387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
        b=jPKsLWh1wQCx+uFkDMaGoQAlzMDmG0XPhV4wljunZLrs09EJyBKRKiDA58n7EuJ/4V
         je2zRLXEtjn1PhsqD28scCYrTMNv37rUYlCCKHjmP+gT4bsRCiOOOEyB14bQkkJ+OgdW
         RADNOn1ivHmCwSQ1sGI/l7e6xuwW/Gpdm2UHqe2TOEQ8on+feWUGlDCprsBXttntqwcv
         ALq9IW+2izLruIIjjsX2CbLCXSzafBAHmkmV7kAQhcM6h2DfnpxJw5CFdp10njk3vDHb
         mfxKOsQgrAX3CcjwG/Joa2GQFssuEbcS2WIHTr3cvhdk35eCu7wCsMeMNYb3UiA0FwXa
         oHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934587; x=1793539387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6vbMJkh4xPzuEcl9o4UTbdDi9m9a6y5s+AAwaTb/VE=;
        b=Fy/OMAqYmnhq5XvvtNEtVI1J9uvL2h2pz2Xv3KAZHXt+scherKqeeVEx3qkvzJjcZ3
         oCs2OHDrwIt475JEBK1ESzf3EirMD+7ewNugPDn6XdRIi5BfEepKYnn+WUnNnmWrw+uv
         cNvJ8H9ByHAZ/Hh0IJkv79zr5+/IyQm39s07GhUOh0ELDtSAbHex7vPlvB1mdTmQHBMA
         UbeMAroyIs2vJuARb5okCCG9Svu/EMddcMSzBahNCEgcADczaZfhowkK3hPKYaIpPenj
         cclaMZ+UuNDsQpDio2ETnD0eDnw+PybKvmV9XF09i/Rh/TEMzDORZPM4EfgyaxdXyaox
         Sq8w==
X-Forwarded-Encrypted: i=1; AKwUvBw+2oTfmfbdvz+rMEuQatqIDXUk1B+NoJ4DWZxXBPYmeCIC8mI7xx4nArMikQiZXereSyY5U+6drBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBy4YWYKJD0Gb4PolcNbuYrGUinKmH4d8WbXXOqdR3mC20tohi
	IIPfYvm9BOckIPmpUovHw9BEr1UpakB9V74A5FIkoSpRUojdXZ354cAvWcxYI2bvkcbxpsJMCIv
	LH8xGvbrQcRD5GTN0SIeLjzqNKuVXYio=
X-Gm-Gg: AYBFou2f87FqeeXmbD1WrnbonzPyudva1pgXHsXA1+Hgoic6+68U1x6mbqEfqpswVR+
	TJ33E5OJ2Ulhh8wNm2auPd30QINK+Ijqx4z0SDNutvyE5iHjv05Zj9WYqGkUZFEOJX8T/prPzbA
	1T0QD3FCAvMVC5cXs2WshHzwqily4X1ktkhQ91c/vAVDHn4OrO/K0IwmLN9Eu5L8w3bDWgJwXnz
	y4kKHc2bq6xvQK5ZYHa38LrXVEG+vri48VwxXfW+P5p1uVBzzFZWOd5TLqUhaKyNM/CWf3FbuOi
	sqSN4NJi60+Ib4qxmEcaQOJ12WkWNCIwwDmIG434YC8+Xr14OUgIFv80V9nehHsXN6q6ZpXQQ0A
	3q/o9pBmQK2IZbjS5p09f85Yf+ODqrL0v/vReNNZT7xw1+F1Uq5cfI/B895h7ygujqnZpL/uGTT
	cCngJNay+ee7cyEdpW3kX+ngyQKkM4UcD4oDoB31WDO787mkCBwYzfRVkpI5wiCD30AAAR5Od+
X-Received: by 2002:a05:6214:53c3:b0:91b:b26a:9791 with SMTP id
 6a1803df08f44-91c48f150camr69861666d6.56.1792934587195; Sun, 25 Oct 2026
 06:23:07 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022013432.2638010-1-gr3yf0x87@skyn3tlab.com> <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
In-Reply-To: <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:22:55 -0300
X-Gm-Features: AclHuK9yewKN0-UZdNUV7XZr57BksERgCEoIcvborAR-JnzTIy1oVpZl5H1ou6Q
Message-ID: <CAMAsx6dgDhfNvw+3NWD1pBxyJfHTa7rUD+-9Y4L5K2FpDXJS6A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: changes.rst: set the pahole minimum back to 1.22
To: gr3yf0x87@skyn3tlab.com
Cc: corbet@lwn.net, federico.vaga@vaga.pv.it, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, ihor.solodrai@linux.dev, eddyz87@gmail.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026, Mark Severson wrote:
> Set the table back to 1.22, in the English document and in the Italian
> translation, which carries the same table, and remove the Italian
> translation's copy of the paragraph that the English document no longer
> has.

Hi Mark,

I went through v2 against the tree (docs-next at f857ff5bf):

- In Documentation/process/changes.rst the table says pahole 1.26,
while the text below it and lib/Kconfig.debug (DEBUG_INFO_BTF
depends on PAHOLE_VERSION >=3D 122) say 1.22, so the table is the odd
one out.
- tools/bpf/resolve_btfids/main.c now rewrites the prototype of
KF_IMPLICIT_ARGS kfuncs itself, which is consistent with the
explanation in the changelog for dropping the 1.26 requirement.
- The English document has no KF_IMPLICIT_ARGS paragraph any more, so
removing the Italian copy brings it_IT back in line with it.
- You mention that htmldocs was not run, so I built
SPHINXDIRS=3Dprocess and SPHINXDIRS=3Dtranslations/it_IT with the patch
applied: no new warnings compared to the unpatched tree. The
undefined-label warnings that show up in these two files also show
up without the patch in partial builds.

One process remark, which I leave to Jon: "Assisted-by:" is not a tag
that Documentation/process/ describes in docs-next, and checkpatch
flags it. I could not find the "Attribution" section of
coding-assistants.rst that the note mentions in this tree; it may be in
another one.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel


Em qua., 21 de out. de 2026 =C3=A0s 22:48, Mark Severson
<gr3yf0x87@skyn3tlab.com> escreveu:
>
> Commit fd5425b67355 ("docs, resolve_btfids: Document kfunc BTF
> annotation emission") removed the paragraph saying that kfuncs annotated
> with KF_IMPLICIT_ARGS need pahole v1.26, because resolve_btfids now
> emits the kfunc BTF annotations that pahole used to produce. That
> paragraph was the reason the requirements table lists pahole 1.26, and
> the table was left unchanged. The text below the table and
> lib/Kconfig.debug (DEBUG_INFO_BTF depends on PAHOLE_VERSION >=3D 122)
> both still say 1.22.
>
> Set the table back to 1.22, in the English document and in the Italian
> translation, which carries the same table, and remove the Italian
> translation's copy of the paragraph that the English document no longer
> has.
>
> Checked by building linux-next 20261021 with pahole v1.25 and
> CONFIG_DEBUG_INFO_BTF=3Dy: in the vmlinux BTF,
> bpf_task_work_schedule_signal has four arguments and the bpf_kfunc decl
> tag, and bpf_task_work_schedule_signal_impl keeps the
> struct bpf_prog_aux * argument, as Documentation/bpf/kfuncs.rst
> describes for KF_IMPLICIT_ARGS.
>
> Fixes: fd5425b67355 ("docs, resolve_btfids: Document kfunc BTF annotation=
 emission")
> Assisted-by: Claude
> Signed-off-by: Mark Severson <gr3yf0x87@skyn3tlab.com>
> ---
> v2:
> - Also remove the Italian translation's copy of the KF_IMPLICIT_ARGS /
>   pahole 1.26 paragraph, which fd5425b67355 removed from the English
>   document only; v1 left the Italian text contradicting its own table.
>   Found by the Sashiko review of v1.
> v1: https://lore.kernel.org/all/20261022013432.2638010-1-gr3yf0x87@skyn3t=
lab.com/
>
> checkpatch reports the Assisted-by tag as non-standard; it follows the
> Attribution section of Documentation/process/coding-assistants.rst as
> published on docs.kernel.org. Not run: make htmldocs; the change keeps
> the table's column widths and removes a whole paragraph.
>
>  Documentation/process/changes.rst                    | 2 +-
>  Documentation/translations/it_IT/process/changes.rst | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index 28f2ca633..13093c5c2 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -53,7 +53,7 @@ mcelog                 0.6              mcelog --versio=
n
>  mkimage (optional)     2017.01          mkimage --version
>  nfs-utils              1.0.5            showmount --version
>  openssl & libcrypto    1.0.0            openssl version
> -pahole                 1.26             pahole --version
> +pahole                 1.22             pahole --version
>  pcmciautils            004              pccardctl -V
>  pigz (optional)        2.4              pigz --version
>  PPP                    2.4.0            pppd --version
> diff --git a/Documentation/translations/it_IT/process/changes.rst b/Docum=
entation/translations/it_IT/process/changes.rst
> index 0be1292a8..b4accd428 100644
> --- a/Documentation/translations/it_IT/process/changes.rst
> +++ b/Documentation/translations/it_IT/process/changes.rst
> @@ -57,7 +57,7 @@ mcelog                 0.6              mcelog --versio=
n
>  mkimage (opzionale)    2017.01          mkimage --version
>  nfs-utils              1.0.5            showmount --version
>  openssl & libcrypto    1.0.0            openssl version
> -pahole                 1.26             pahole --version
> +pahole                 1.22             pahole --version
>  pcmciautils            004              pccardctl -V
>  PPP                    2.4.0            pppd --version
>  procps                 3.2.0            ps --version
> @@ -149,12 +149,6 @@ Dalla versione 5.2, quando viene impostato CONFIG_DE=
BUG_INFO_BTF, il sistema di
>  compilazione genera BTF (BPF Type Format) a partire da DWARF per vmlinux=
. Pi=C3=B9
>  tardi anche per i moduli. Questo richiede pahole v1.22 o successivo.
>
> -Dalla versione 7.0, le kfunc annotate con KF_IMPLICIT_ARGS richiedono pa=
hole
> -v1.26 o successivo. Senza questa versione, tali kfunc avranno prototipi =
BTF
> -errati in vmlinux, causando il fallimento del caricamento dei programmi =
BPF con
> -l'errore "func_proto incompatible with vmlinux". Molte kfunc in sched_ex=
t sono
> -interessate da questo problema.
> -
>  A seconda della distribuzione, lo si pu=C3=B2 trovare nei pacchetti 'dwa=
rves' o
>  'pahole'. Oppure lo si pu=C3=B2 trovare qui: https://fedorapeople.org/~a=
cme/dwarves/.
>
> --
> 2.43.0
>
>
