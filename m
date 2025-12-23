Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8BC3594A
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766524949; cv=none; b=L6TjsWLkr0/794fxOQfjEQTv7+EW+77jZBOXOQyjp65E2im6vqFM1o5XPWRQSRgK51U6CT++9CFdJHACy2BAxrJuuWaml6lWHR+ZjLkxKaU6AWqzhdxBaTgWaeQMsU8Ef/ICGyNhzQy0t8o7dlz5QG4JY8mpHxgBiieijztC7QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766524949; c=relaxed/simple;
	bh=Z0vEqqUawS2DoxCMjVrNlYVCYL/zGs0ohRiNlsdaD4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+oBxnd76TjzhI8OOKboihXDypztl2XSHlBAJfFa28/T+KVcvllPXJwKa+lNJdk9CR2TviO1BqQvmjuFMe9FMwjHLA4JdN1SywE2lpVf8JqX2QUehAUNejMl4kNxC+cTrnNhnpqK/E4ttM3OT5URrTZ2mrZLgtqifv0F2RltNKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=W7RLjlaE; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="W7RLjlaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail3; t=1766524937; x=1766784137;
	bh=e6UJWjwLMsR5OEYp1GUNbhrJcd0e3dhZ1c7N5UV1Gks=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W7RLjlaENrWafamlv3Nd+I/LssL9HxfJz+RbIOkWot8nfFxezS9hZ0auxCbkmLM0w
	 kISPQFri77xIN63DI84JdnjHFOhugNyJvJcxTTsbArLs8j09hPALDpN7rb339dImrR
	 ZAownyEpEE3beP+4/U/gBksk20A5mnTuz33W+qxHvy2WLYVOZJ54dnL4iBHU3dVTsv
	 zl6csca1OnIt1eVfhxVHr4CvqA86ZbSz7+6lMYF8DCWofBN1CzF0Q5u5TQ7s47uo6z
	 ln6lKMqhNsrAlGeIeVR9bYANmzcydDvP6atLXtCx8/hF2CL9zTUOqggb3OXk6S/OQS
	 wlV8E9TsFlQsA==
Date: Tue, 23 Dec 2025 21:22:11 +0000
To: Jonathan Corbet <corbet@lwn.net>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
Message-ID: <b5niunhlqabuekgmsf4xrhqntx6qwi44mh7smntocomfjhoadk@fazjt4uqiv4w>
In-Reply-To: <87bjjq18h6.fsf@trenco.lwn.net>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com> <20251205111559.3089219-1-andi.shyti@kernel.org> <zylu4ulxeyni5diwnp7o7evcajqyylhzzd4d2skyi2ul2ayb3b@2kojo3dyp2vi> <klzag46p6mlqqdrogqofancqyjpvs5lmwa4m3tjszcgavdwa6s@nay2uuwpsvlt> <87bjjq18h6.fsf@trenco.lwn.net>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 03ba105159cecaff3b6a28d1f1d5a116c808abe1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Thank you for your message

On Mon, Dec 22, 2025 at 03:01:57PM -0700, Jonathan Corbet wrote:
>Andi Shyti <andi.shyti@kernel.org> writes:
>
>> Hi Federico,
>>
>>> >-Il file di intestazione include/linux/kernel.h contiene un certo nume=
ro
>>> >-di macro che dovreste usare piuttosto che implementarne una qualche v=
ariante.
>>> >-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttat=
e la
>>> >-macro:
>>> >+I file header
>>>
>>> In Italian, the correct name for "header file" is "file di intestazione=
".
>>> Please, don't replace correct Italian with *Itanglese* :)
>>
>> I absolutely disagree.
>>
>> If you open any C book, they are called 'header files', except
>> for a few Italian technical books with excessively literal
>> translations, where even non-translatable terms are translated.
>
>I'm unconvinced about "file di intestazione" based on my own
>understanding of the language... but, in a case like this, I will defer
>to the creator and maintainer of the translation.

Due to my explanation in the previous message, and after your answer, I hav=
e the
feeling it may sounds like I'm making up words needing persuasion. Probably=
 I'm
misunderstanding. Just in case, please allow me a clarification.

"File di intestazione" is the equivalent in Italian, same semantic. It can =
be
found at the university, in books, in youtube videos, and in tutorials abou=
t C
and C++ languages. One might have different opinions on the term. But it is=
 a
fact that the term exits, it is Italian, and it is used.

> [...]
> I chose to use Italian terms: (a) when they exist, (b) they have sufficie=
nt
> diffusion, and (c) if it adds value for a wider audience.
> [...]

A short list of references.

Universities:

Napoli: https://www.docenti.unina.it/webdocenti-be/allegati/materiale-didat=
tico/94515
Bologna: http://lia.deis.unibo.it/Courses/FondA0607-ELE/materiale/Lucidi/Pr=
ogettiSuPiuFile.pdf
Milano: https://aguzzoli.di.unimi.it/didattica/algo12/lucidi1.pdf
Torino: https://staff.polito.it/claudio.fornaro/CorsoC/09-Stringhe.pdf

Wikis:

https://it.wikibooks.org/wiki/Dal_C_al_C++/Utilizzo_basilare_di_librerie/I_=
file_di_intestazione
https://it.wikibooks.org/wiki/C/Compilatore_e_precompilatore/Header
https://it.wikipedia.org/wiki/Direttiva_di_inclusione

   From Italian-aware automatic translations:

https://www.ibm.com/docs/it/aix/7.3.0?topic=3Dreference-header-files
https://learn.microsoft.com/it-it/cpp/cpp/header-files-cpp

Books:

Original Italian:
https://www.google.ch/books/edition/Dalla_A_alla_Z_passando_per_C/OXoFAgAAQ=
BAJ?hl=3Dit&gbpv=3D0

Translated from English:
https://www.google.ch/books/edition/C++_Fondamenti_di_programmazione/fPaLAw=
AAQBAJ?hl=3Dit&gbpv=3D0

Another source from the GNU/Linux world:

PLUTO (Appunti di informatica libera):
http://a2.pluto.it/a292.htm#almltitle3828

--=20
Federico Vaga

