Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899B2E5D32;
	Mon, 15 Dec 2025 00:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765758624; cv=none; b=IGKVoBkg74k5tRGLLWh4SG/04xwD86bzbSiRZ/+IKLclk+RYrGyKnrQUO70LnLmIRz+NNR5ioiyizp7kG3fD7bTNEPZE21XTMLmtVQmAPA7UZqs+wEq7+BegXwfiZmVrSW/1LDK9hCjRGbmpsFCO8Sf/lGBdlPky4vRz0SzutIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765758624; c=relaxed/simple;
	bh=TFd0dgLHm+H5ACxwUPqFjyfU1QznFq5SNOfOT1UCUkg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxNKFvSFOPID8uAwS0WOO/bhYuGnJF8NCmWSfyNaZF8hU8mPQYkV5PeHmPElBVr+QIIvoW6AwW77gZPUaeSUjHTCY0TV/A8r+3ZQYcamuVMmSHR+PylupcWsdSFVr+kKZc50GkNHM/4Wb9PNgJm+Mpalepa+a0+fBZBMrVKlHUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=J4CDBd8k; arc=none smtp.client-ip=185.70.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="J4CDBd8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail3; t=1765758612; x=1766017812;
	bh=qgusd+DDeeZ/7y7gE3oxyBkzOXzvYs4mK/p6bfcfIL8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J4CDBd8krukhKuJyX+fzCzfGMlZL3b1c281KfLvZZ6Rd/g5rV3KjA3CM8M8GI0lMM
	 9t9+UBVfJzVwvvW88Oc610ooIYVFhHL+CTU4dYqK32DLSRHG/8Bn0oZ7+4gmIEMsVx
	 Y2zeeWSelNPmiTHU6k0LCgprxuO5l5mjevQrUaR0fKcgsNkcgR2b9hw08aIsr/jsuo
	 YTuX4IhgKUFCNAZ+SrFCM/rrn2L/wqzlq38bfSYEBzO8I60YKhkQb9Z0MWL9QW6pWL
	 TgnTERtw9U7/NFomsUn6DiaCEEd26S/NuBKCGRWUFKBqfTc5BQsX1ICUa6y+P31KCg
	 bRl8nmYNaejtQ==
Date: Mon, 15 Dec 2025 00:30:04 +0000
To: Andi Shyti <andi.shyti@kernel.org>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
Message-ID: <zylu4ulxeyni5diwnp7o7evcajqyylhzzd4d2skyi2ul2ayb3b@2kojo3dyp2vi>
In-Reply-To: <20251205111559.3089219-1-andi.shyti@kernel.org>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com> <20251205111559.3089219-1-andi.shyti@kernel.org>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 4027285f8ecd1b79aa2536d8ed0e1bf0f713ea71
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andi,

thank you for contributing to the Italian translation.

On Fri, Dec 05, 2025 at 12:15:58PM +0100, Andi Shyti wrote:
>I also took the chance to improve the phrasing in a few places.

As a technical translation, we should not try to make reinterpretation of t=
he
original text. See comments below.

>Andi
>
> .../it_IT/process/coding-style.rst            | 19 +++++++++++--------
> 1 file changed, 11 insertions(+), 8 deletions(-)
>
>diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/D=
ocumentation/translations/it_IT/process/coding-style.rst
>index c0dc786b8474..b2fd74528de5 100644
>--- a/Documentation/translations/it_IT/process/coding-style.rst
>+++ b/Documentation/translations/it_IT/process/coding-style.rst
>@@ -1068,15 +1068,17 @@ pu=C3=B2 migliorare la leggibilit=C3=A0.
> 18) Non reinventate le macro del kernel
> ---------------------------------------
>
>-Il file di intestazione include/linux/kernel.h contiene un certo numero
>-di macro che dovreste usare piuttosto che implementarne una qualche varia=
nte.
>-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttate la
>-macro:
>+I file header

In Italian, the correct name for "header file" is "file di intestazione".
Please, don't replace correct Italian with *Itanglese* :)

>presenti in include/linux mettono a disposizione numerose macro
>+che =C3=A8 preferibile utilizzare, evitando di sviluppare implementazioni
>+alternative.

I think it is less accurate. In English, it tells users what they "should d=
o"
and "should not do". It does not speak about what is preferable and what to
avoid. I agree that, at the end of the day, one should come at the same
conclusions. However, the translation should be as accurate as possible and
make adaptations wherever necessary to improve the understanding.

A would be perfectly fine if also the English statement changes in the same
direction.

Including your suggestions I would write:

"""
I file di intestazione presenti in include/linux mettono a disposizione num=
erose
macro che dovreste utilizzare piuttosto che implementarne delle varianti.
"""

>@@ -1084,10 +1086,11 @@ struttura, usate
>
> =09#define sizeof_field(t, f) (sizeof(((t*)0)->f))
>
>-Ci sono anche le macro min() e max() che, se vi serve, effettuano un cont=
rollo
>-rigido sui tipi.  Sentitevi liberi di leggere attentamente questo file
>-d'intestazione per scoprire cos'altro =C3=A8 stato definito che non dovre=
ste
>-reinventare nel vostro codice.
>+definita in stddef.h.
>+
>+Ci sono anche le macro min() e max() definite in minmax.h che effettuano =
un
>+controllo rigoroso sui tipi.

Here it is loosing the "if you need them". If removed here, it should be re=
moved
also in the English version. Of course, one use functions if they are neede=
d, it
comes without saying.

>=C3=88 consigliato consultare i vari file header per
>+vedere altre macro gi=C3=A0 disponibili.

"file header" -> "file di intestazione"

Here, the English text is more colloquial and speaks to users with some iro=
ny.
In your adaptation these things are lost. Which is fine if also the English=
 version
looses it with a more cold/professional "It is recommanded reading ...".

--=20
Federico Vaga

