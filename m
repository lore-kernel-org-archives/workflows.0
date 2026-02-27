Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310338A72B;
	Fri, 27 Feb 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180876; cv=none; b=t9F2JZVOGwdNL/Clqgffr17gWcaeIgpvv6iBJT8/IeyWs7TF5Hn+9XSv97FzfyhpsZG4dRjzv3YbJjvHDpORHfPntMPpa5ZXbRYVYdz8qDVEBveDwQXNBBJUNw80c3VnPWfVMgaS/bQpGpQxuwi+FFzgcU16c9TreDw6/ZXXTWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180876; c=relaxed/simple;
	bh=6C3cMM/gHC6Ff7yqF4c0Tovc8j6lpGWIr+4iZ/HJVcY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M11K2rednOAqemkwGa1qZdM2JVPOFoeDCF0Be1CNy7y2vFq43O+9TVJRr0FrxAFq7DS4VaQ4kU4/5QYrDMxQlSZFfyjNvslqBmJYq7q4nvZ665pFxi+PePv9Ztrw8M+xiQmD3Gcdk613SjhmHHzKPAbu0u5cGsoChTieMkfNOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BUbKSCA8; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BUbKSCA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772180869; x=1772440069;
	bh=w1GCmvI9nDdcfpwv/EBNLFU8kur4WRAZzbZH+/hHGr4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BUbKSCA8rMLpH4diWu8+qNpkBu8rwdNvP3PQX7+KdePmgbyPDqqkofUa0Q1gDf4N5
	 vNi7PAt9rxLG0sC22KHfiv4sVrIIAgxEXWUHxGBLw3BcL2RDYRCKgWvGoOx+j2EECT
	 2L9peFmczADoIso6h+zfazpGTslRpa78reEUcqfRhv51tU3MscxoKc2Kx5ov+2QQPJ
	 sTUzeNzHd+l2vCJi0eR8cAbvTYpTf+Yl4vBO38h5TvxAZzgYnEjjLcscOFaBtdsjEd
	 xIUNLnhnVbi+eTHzHcjmxiaEy3SpkmMKUASLYv0MctPQZ2m3j9M/hFrDU4QUdU39dW
	 9ieH08Jp5rs2g==
Date: Fri, 27 Feb 2026 08:27:44 +0000
To: Dave Hansen <dave.hansen@intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org
Subject: Re: [PATCH v10 13/13] x86/kasan: Make software tag-based kasan available
Message-ID: <aaFVCivIQ1kjKhUZ@wieczorr-mobl1.localdomain>
In-Reply-To: <fb8d8d51-66c8-4cb1-8b14-bc670c629afa@intel.com>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <8fd6275f980b90c62ddcb58cfbc78796c9fa7740.1770232424.git.m.wieczorretman@pm.me> <f25c328f-4ce7-4494-a200-af4ba928e724@intel.com> <aZ1qOpMc9PohArcL@wieczorr-mobl1.localdomain> <fb8d8d51-66c8-4cb1-8b14-bc670c629afa@intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 98763143edaccaef44e93295f566fd10be419899
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-02-26 at 15:29:15 -0800, Dave Hansen wrote:
>On 2/24/26 01:10, Maciej Wieczor-Retman wrote:
>>>> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN=
 shadow memory
>>>> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN=
 shadow memory (generic mode)
>>>> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN=
 shadow memory (software tag-based mode)
>>>>    __________________|____________|__________________|_________|______=
______________________________________________________
>>> I think the idea of these is that you can run through, find *one* range
>>> and know what a given address maps to. This adds overlapping ranges.
>>> Could you make it clear that part of the area is "generic mode" only an=
d
>>> the other part is for generic mode and for "software tag-based mode"?
>> Boris suggested adding a footnote to clarify these are alternative range=
s [1].
>> Perhaps I can add a star '*' next to these two so it can notify someone =
to look for
>> the footnote?
>>
>> [1] https://lore.kernel.org/
>> all/20260113161047.GNaWZuh21aoxqtTNXS@fat_crate.local/
>
>
>I'd rather this be:
>
>  ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shado=
w memory[1]
>
>...
>
>1. talk about the ranges here. Maybe: Addresses <ffeffc0000000000 are used=
 by
>   KASAN "generic mode" only. Addresses >=3Dffeffc0000000000 can additiona=
lly
>   be used by the software tag-based mode.
>
>Or, list both ranges as separate:
>
>  ffdf000000000000 |   -8.25 PB | ffeffbffffffffff |   ~8 PB | KASAN shado=
w memory (generic mode only)
>  ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN shado=
w memory (generic or
>=09=09=09=09=09=09=09=09=09=09    software tag-based)
>and describe the same use (generic mode) twice.

Thanks, I like the first option, I'll work on that.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

