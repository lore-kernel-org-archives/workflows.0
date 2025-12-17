Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29230C34E;
	Wed, 17 Dec 2025 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766011707; cv=none; b=aQcR7+UYEK6VxI4oyVQIAKtoGoZ2hhHbMeiAKsCezMhAjgWziP1uXfX7xvErY4A3uh7Icfmj+KOqaZHtO9BKrwFh34/r/5lyf1llBe2dwTQW0wWVp9hZAEpzZM99bnX3/wXaiIKtxcFNdWz+DFFMRqGpG5tNZapEab2OWHZAxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766011707; c=relaxed/simple;
	bh=PAxAo5quNAi+gst5faXlKFJ/3qyIfTDoysXHlq8Mi9s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OF2vRf0JR+Y8u69Hs4NAN/yDAPa+8KX+0foqJk7dlOrQeRNx9Xd0om9FYgoPOSIOuAMZaGq6t5h5Qje3F+R8xSUJzr6KIbdYqpjijAN2VoGVKx5iiaq06M5KoDIhIJU/w4XxO6vMrnvHLjLNwssR9CjIlAB8dOOmkIybFOeS6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=fail smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=ac5jqQO0; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="ac5jqQO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail3; t=1766011685; x=1766270885;
	bh=PAxAo5quNAi+gst5faXlKFJ/3qyIfTDoysXHlq8Mi9s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ac5jqQO0eqpQkP0w27ilV8+f+cmRMve7XAmQkubjnpFyt7T/2Gm46zcY5VJXiCENv
	 dS9yIIPjOGc6VljVdQNtBWdUVYF7cQbJoimhTXkwHs+V/6OSZsdUU8RO2kTja3vkOt
	 XKhn/BvQkDYF5dfx01iMQN8jYHUoclt15fsoI9Mbf+bLhZo2+n3rXD9GwZY6uUxudK
	 o43HC5UHQdFNCRIdlsUjZPTaTWMzzXm+pFqhtFbSUS4KRQS2k3EcLgf6U1ag5oY1R9
	 pKr1PEXI/RsTHVNGKzn53uzIl8VV+utcF3BsVYhOYFQTEtZ7SpdgTyOhXR0u36rEuT
	 xh5l+qztxObuQ==
Date: Wed, 17 Dec 2025 22:48:02 +0000
To: Andi Shyti <andi.shyti@kernel.org>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
Message-ID: <un2p3f5qe5lwtln2c6cj5yutnhcphxawjowhfldd2h2rvpb4k7@om7ddhs6ipwd>
In-Reply-To: <klzag46p6mlqqdrogqofancqyjpvs5lmwa4m3tjszcgavdwa6s@nay2uuwpsvlt>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com> <20251205111559.3089219-1-andi.shyti@kernel.org> <zylu4ulxeyni5diwnp7o7evcajqyylhzzd4d2skyi2ul2ayb3b@2kojo3dyp2vi> <klzag46p6mlqqdrogqofancqyjpvs5lmwa4m3tjszcgavdwa6s@nay2uuwpsvlt>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: db255a47da83f8f39ead25d753db542b3ae758de
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Mon, Dec 15, 2025 at 05:14:02PM +0100, Andi Shyti wrote:
>Hi Federico,
>
>> >-Il file di intestazione include/linux/kernel.h contiene un certo numer=
o
>> >-di macro che dovreste usare piuttosto che implementarne una qualche va=
riante.
>> >-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttate=
 la
>> >-macro:
>> >+I file header
>>
>> In Italian, the correct name for "header file" is "file di intestazione"=
.
>> Please, don't replace correct Italian with *Itanglese* :)
>
>I absolutely disagree.
>
>If you open any C book, they are called 'header files', except
>for a few Italian technical books with excessively literal
>translations, where even non-translatable terms are translated.
>
>Italian technical translations usually preserve the original
>English terms as much as possible, which is quite different from
>what often happens in French or German.
>
>'File di intestazione' is a literal word-by-word translation.
>If you want the proper technical term, it is 'header file'.

Both English and Italian terms are borrowed from typography, "that thing yo=
u see
on top of your document": the header file. In Italian, we never had a neolo=
gism
for "file", but we have a typography glossary. So it becomes "file di
intestazione". A wider audience can quickly understand where to look to fin=
d the
mentioned "file" because "intestazione" means at the top ("in testa"), like=
 in
English.

As you rightly mentioned, other languages are more alive than Italian and t=
heir
speakers naturally make and use neologisms for the new things popping up in
their lives without scandal. For Italian speakers, these days, it is harder
(already this email shows that I need to justify the use of Italian words i=
n an
Italian document. There are some publications about this problem if you wou=
ld
like to know more). However, I don't think this should be a justification t=
o
forget that terms exist and should be used. I'm well aware of all possible
variants that you can find in Italian original texts (they exist) or
translations ("I file di intestazione", "L'header", "I file header", "L'hea=
der
file"). You wrote that the good one is "header file", but four variants exi=
st
and your rephrase used "file header" (swapped). When I started this work lo=
ng
ago I had to chose an editorial line, and I chose to use Italian terms: (a)=
 when
they exist, (b) they have sufficient diffusion, and (c) if it adds value fo=
r a
wider audience.

For the case at hand, any web search will give you various results using "f=
ile
di intestazione". You can also use Google Books. You might still say that i=
s not
your taste because you prefer English words, but it can't be denied that th=
e
term exists and it is used.

On this particular subject, I think we are a bit off-topic. But if you want=
 to
discuss more we can continue aside.

>> >presenti in include/linux mettono a disposizione numerose macro
>> >+che =C3=A8 preferibile utilizzare, evitando di sviluppare implementazi=
oni
>> >+alternative.
>>
>> I think it is less accurate. In English, it tells users what they "shoul=
d do"
>> and "should not do". It does not speak about what is preferable and what=
 to
>> avoid. I agree that, at the end of the day, one should come at the same
>> conclusions. However, the translation should be as accurate as possible =
and
>> make adaptations wherever necessary to improve the understanding.
>>
>> A would be perfectly fine if also the English statement changes in the s=
ame
>> direction.
>
>I think a literal translation is not beneficial to the final
>text,

It is not a literal translation. It is a translation. For example, if there=
 is a
joke inside the documentation, that joke gets translated no matter my opini=
on on
that joke or jokes in technical documents in general. If there are implicit=
,
rather than explicit, references they get translated as such. If the
documentation needs improvement, it must be first done in its original lang=
uage,
and the translation must follow.

>and we have some room to rephrase it while keeping the original meaning in=
tact.

Why not using that room in English as well? For example:

""" From the patch
Feel free to peruse the header files to see what else is already
defined that you shouldn't reproduce in your code.
"""

""" Your suggestion
=C3=88 consigliato consultare i vari file header per vedere altre macro gi=
=C3=A0
disponibili.
"""

This reprhase is not anymore -->friendly<-- inviting users to read the head=
er
files and discover new macros, and it is not reminding them that they shoul=
d do
it to avoid duplicating code, probably incorrect code (the entire intention=
 of
point 18 of the coding style document).

A reprhase for better readability would be greatly appriciated, I'm definiv=
ely
not Dante. In doing so, remember to not delete things or change the tone of=
 the
original text. If that is your intention, then do the same in English.

P.S. I'm interested in the non-translatable terms you found in Italian book=
s. In
the past I was doing some researches on the topic and I'm genuinly curious =
to
see what you found there and see their etymology :)

>Andi
>

--=20
Federico Vaga

