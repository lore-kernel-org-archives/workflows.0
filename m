Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494173ACF0D
	for <workflows@vger.kernel.org>; Thu, 19 Mar 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918634; cv=pass; b=n45tGmtucCiLyGomPKZ4kySBFyEeFNSYgJdl+ugrkriNLPF2aHGVcVtv5lrnTgB8HeLI56mm1Rb6KBWjyhp/TW3TUJUEzZ1fXFAwtQBE2v/rVqccMTkNV05nHvUn6EkX7u9YRFTCaHRKRiiTJRkHQ5X8vHtF9P8Wkud6YEFo5V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918634; c=relaxed/simple;
	bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4291xQuAQQt7LmEidyPLv3+gLZQ8f4IQLdd1Y4S24mOg0lIJKwu+WnLnTW7d6wCm9yQApXDtzZik3gfPu8jSg7ZQmjr0tDdttNF6Gd/kGNKYJKtxac00OrbOsyVKONXYj9zQw+nFSp105BdaFzpqF5JX3rzRcO8BaM68q5cRVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6ezXUCo; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6ezXUCo"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0f76bd201so38469eec.3
        for <workflows@vger.kernel.org>; Thu, 19 Mar 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773918632; cv=none;
        d=google.com; s=arc-20240605;
        b=HecHGubQZyRpKl6bQoyAt5UlXWoRabqR2WozYXcTuRDKKCw9+iSaugmZ2umsrdzwHO
         /85sCFBNky1eBQkMUD+M9tnQyvkkyRhC5zd8rEFnZkd9bqeiJmVqhRQ8B6NdQvrE0xDO
         znr28IqehaE9rqGpfQWt7qskUGBSEFH5uAyhVStbpce++Ay6RRQThNdGPq3OptIpmbgg
         nmMA8GXQKkjG5c803rVeJUv1In7Sz+8+MircOgEFHvbIST5yjtLkSeuJphZs9I29k+cI
         0REhQo3VYLZAKhmHxzC8RWLfAwutNT+CKGhlCr0Qe9oDm0LPLOBEAHXec0l5TFnc2f3N
         F4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
        fh=NBPzU+SYkMmbtQFHCNvxLNsl1GB4thjPW3x/ZKqQGKo=;
        b=gB5xxBhtLrwGqrr3AoLVYoO+G7Ndrb1RKyOSb1k+1NpAOCT/G6H0HYi6NsM5rfLE9v
         Kqmfjss6WL4EIz7KoTec0nBDVXQttymC8ID/hmGFuBzR6FhY+gMgjXg+wfL4OVT01S6T
         ZICsvjdz9TKJYysBPbn+ZGttFNmUYT3DVZ9KkdomE/CI1pid/ZRi7liT5VdahjzJEKKI
         WFfXnMKyhhfdm+xtq+Gy9LO+QUccElmdjvcOFXdMJ/Ez35XRtIBckR2i+b45zOxldcEy
         l+2SHufG3+5kEaD16AG9aZ8UBPOs8ucN9Ls6S6sMDvWXsvjDXKB/48TLwjSPQUpeAKtx
         NhNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773918632; x=1774523432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
        b=T6ezXUCoptvgnnEcWGJ3FRNIRg3jX2oKFY8vnWV2QJbURojpOLd3s2IrrpqRf+A3rU
         3zMfQ9krXXf3JixitWlqdgPaMUJ5YdbhzvxsM5tWaj/FDoEfQ2YWQS1vptoSAsW8WTRq
         ZjGKsxu5oM4ye11Ynkyo4lyIBlwhSd4lbxTGAZ+P/jzeGtu6iYWgw9XkBj6SzfExC7/k
         693U6G57sUghtsnf6MGD5dGuq2hy4gkgpvTShQT6flKFYO0KJH/1MWZVhFc9ZETBpnMl
         vbNc+EVPpNYv8kSRNYJd8rRyPV3oxkN54ATN3KUCmZ6P+RYOz5WSe9HUcWY+YHs7MejY
         hW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918632; x=1774523432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q28JNE3zOrnDMPOslKlKb31VcOPAQPXKgyip4TutYZs=;
        b=ePz+TKg5+faLQFi0/0zvroK3kn70xdw7orbMa31lsrSSvuQ96QH+mgVb4EZo1j9/Gn
         eRv/H0i5FWO6J2Ef9JEjyuKap6kW6oBThzY/XV5dloARoi1iV4GTBN4WmsjHqvbczBS3
         ACFS+PdpILCVVnh9ACvEyepNYoO8MCO/Uewq4N4esAyBh/o+y2IJEb1J4zXmmwLspUtN
         MLbRCMYavCaiiNdXN3ch9xbBDukNRNib3nA7YUxdQR4yIjwRLACdRIYPN0kVsZ9CIgXp
         jwitc/GQ/hAXXmYKOaHwjtNeN0kJC8JO4VT1lPoSYPN74tXtL/HLJFCzl1mpnshIacNH
         ikLg==
X-Forwarded-Encrypted: i=1; AJvYcCVORO5hxKBJtKLzHoMqCz8Cvw/pF2L3rytKmpPfhRypWg+I5YzcT/I3txuLrxFgd0GyjSxWBGfmW8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYa11ZfG2npnULlz6HlXRcF6JwqfSKGrDzpgz76YCt7qS/sY/t
	9ZH0AWt/bbaYIJjhmMfyLPYlM1aEWQhYVVpW9RGtYCkCW4TxwFLAKVE8mTzClb9iOxfv47aX7fN
	BeR32Pqw0f1b/U/TTqYOjBImiWe9/vlg=
X-Gm-Gg: ATEYQzxxyzUawpAL1osjruZknd/jgcoKo0Bf1QqbxgmIDTSN7IbkvxdgnmZcrJamVy5
	noi/MrCtFayD4sfbkxWsEUQzOHYjGoAfC3EGCS+ahvpmvJ6qeE2m9BiISqoYsqyrcYdBHPxKlxm
	Lh3Hdbgdz6VNOkKFwIwou/CQjuRqRQ3XjqWPnFJ0O2NwzgxleWKowtDoS3X+wl6lPMckZy/Anvi
	FcGk2GoW70CNsnFa7fL3eQhl913FjVxampx2OF4h7DfRoDD5wV+O5U38iP3MyhkcTe/vb1gOSv7
	gHL3Vrj9wxM4zjJSg0UbNvyIUs0YZNO76tG/aW1j2FmXKk+hb3II9E4th0X2OWDwcUcbEkgR4ep
	FHa6x/+onelQd+poz4D2930I=
X-Received: by 2002:a05:7301:1285:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2c0e528a5d4mr1401381eec.7.1773918632327; Thu, 19 Mar 2026
 04:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
 <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com> <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
In-Reply-To: <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Mar 2026 12:10:19 +0100
X-Gm-Features: AaiRm50fomumEtRa1rcztbB8_A65g2UTx_UuAfqMwTNqyrG_bjS2Jj1Lf32hxKs
Message-ID: <CANiq72=t=q4__vwTFjg+gQyjKLUEJrZBngr3cAnnKiTNM5uteg@mail.gmail.com>
Subject: Re: Hosting first-party kernel.org container images
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Ben Copeland <ben.copeland@linaro.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, workflows@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 3:44=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Nathan, Nicolas, Miguel - what are your thoughts on this?

I agree with Nathan that `Containerfile`s on git.kernel.org sounds good.

While many kernel developers may not use them (mostly because everyone
has their own setup already), if we had a set of "base" images that
are maintained by someone trusted (including publishing them in the
usual registries for easy use), then I think a bunch of us would
actually use them for CI and possibly other tasks; just like some of
us already use the kernel.org toolchains "manually" anyway etc.

It could serve as an entry point to discover the different toolchains
and software offered by kernel.org, i.e. not just the GCC and LLVM and
LLVM+Rust toolchains, but also perhaps `b4` pre-installed and so on.
Even things like `tc-build` or the latest and greatest set of AI
context text files could be considered too.

It could also perhaps simplify a tiny bit giving quick reproducers
compared to giving the instructions for a distro base image + extra
things to install. It could also be a good thing to give newcomers
(i.e. how to set up all the development environment is a common
question) and LLMs.

I mean, all this is nothing new of course, but sometimes trust and
convenience go a long way.

I hope that helps!

Cheers,
Miguel
