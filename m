Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEF2469847
	for <workflows@vger.kernel.org>; Wed, 14 Oct 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013892; cv=pass; b=aA3WOaZ8k+sXbWq44uQcw+r0Oz6/9VcGrVJOmvocqThVebLtbKfY54x4iJuY7Wv6yEGvzY3DXh9UbwoZxle1RIEzEpN1UCk8M4Fe/CymFwGDAyWpLLtwvAgnrUuwOev8cngDDDvdO839nU3jaRUtLPmnU0G65pp1huyosBguFDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013892; c=relaxed/simple;
	bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj1nBZeq+VoH8RB5k3kqwYnUwto7IhVFLoNbjWTuMhs47PSzJBwOnPa8i6q1OGysEoAc2TV8eVYoZox5Ip5xNqSsbRXzOSNGLWFEYUF+ZJxuV5D2Yza5DRhUNRXMVG+EEGQKb4QUSg0xpC0I+Ay8Uk3q/v6sdjSVo1ND8JskhEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGTX0rAd; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGTX0rAd"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33e623bd651so545631eec.0
        for <workflows@vger.kernel.org>; Wed, 14 Oct 2026 14:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013890; cv=none;
        d=google.com; s=arc-20260327;
        b=SgwZdABHAnPitbAaqZJ86D8ZX7hjm83Hxt9Gc0q+rxxE17b5VR7mWokhe3wGwayGxb
         ehplMUAaZP7bzVHeNGfVea38xzI2ZEdZQ+ZHHWT5K87YW2jK1sHWoiyds3EvjMlJ6NoY
         3/4sJn0lSemMtgSzEPw+K+Az18oY05/Vv2eLour0CZPRCTQ8QjiSb1zvmFQ0i/9LyEQm
         wdZxHuBIu/KqV1hJDq9xu9uHmOWYQwgVx7SuNlOW256a9uTS13ZYIDYZfM7PkXvmR58U
         Ympp+LzzNN4xZwXo0A1ZphObSxTV6OFWnTLny0btlo/njc4e8MTrDF/5vg2bQAFwlnci
         nUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        fh=kwiKkDDdn/7zjvf7GrvkI/BEjQOVGulo96T7DMi+NTM=;
        b=YOsSFJQKujvvsvyy4cDZWaXMVVQrGjvxnPVE6JoRGK+qdxnMGggkM98RtEajNkmGbX
         JZYSu7Ciwj4OzTMkgAAnrJ/ONQo4aleV/nn3xmOAOZPjkmkLREvlNP03dKwh2N/N1Edm
         FRrNYdCR/mMg2h4QwMtC/2IIk415i7Eh9PTUnVWlvRZI+tq3ndJuaQoljBqS6kRjEv8U
         bn4g5Gd6b6KqVYlzAYM5mhFqhsZ5bi3aze68UapsKWsEWQ95IK/X+Qy7iatN+A0h1C2M
         GJQOOFmdxOOMGpWOc41OIr271bKdBucanqijvLaSRx4S8rnTG1gYy8Mgwqu4dtaHyhmz
         jruQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792013890; x=1792618690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        b=hGTX0rAdLrHkQZaD2CeBaZKsVbVF2IkLrZRo1HfoeIVqYfX676cT4xfAvr13VPkyhK
         sRPwCWgqD4GMtK6r1i14dwVNSJwU/pfvsHlWDQ9VhSNb5JFwd9/Ms7rurJ9AVVkWpBU/
         xXCtaoz4XFOSsDot9tkzsV4tr5s9pdQDXKtmIa8KD9XrYz/tfH38lcBx3cXGQPCgswMC
         PfJWnWRjq4RIeMmzJF2zJ2PapE7g6TF43Mf3pN57dx62sg0QCrNuNlrX592M6ktYxwMG
         wLBIgW3KNJc/JGkgeUw3o++Yvk8R4hHN/aypJtUQFUdovlmvgR/w7g6tAR0tG4udjVC4
         ifBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013890; x=1792618690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        b=tAv+Hm7MRDZEmS3qgPCJVgnPisiywQrwvoKAmoiLDlfovbKal/a4wMtz3Hql0VMQXQ
         DEAaTGGtj0djMEtlXariqE2zKT4P6f1/QM3sgVPOQYjkbspy6sDo2YJc+uz6PWf9JLLU
         dk1NQN8h/3d8WVbvqeZORYrMGCEg/ljOEnGK5BrLAOs4nA7+7jRl8By1aRROql3Qy85o
         LNXmXzM0+8Uv3GU+ZficxYnYtlGwzbBKI++OlclXnjoHzil2D5AIdeX8De0K5KGW5GFw
         iJEPfMmZf64DTlXByN9OdjrU52cuHdCLLTOJFTQe4mJkBnzDUV82AiSaiiIWu37WeAfq
         7hag==
X-Forwarded-Encrypted: i=1; AKwUvBympzPChxyCjlW0Zd1uMxejiqUxtXp3/AaTAPmIF10Ur/WOQQzLq9L6//pIg1VDB1IL+alwuCkgAVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiWy2C5eXNx5/PypJcwRBLGgWvLMuKLbLoEl9aJewHDnmNpE0w
	ccEjpHKHaW2FIv5PMII2syTUCPA5Qq/y8HIXiITXw5dzKkiV27vWA/Xjm4sWY8E3wbUOtE8OM/9
	w56+SpUD6Fs3O7POnJdtMmGQNwJmVPsE=
X-Gm-Gg: AYBFou1iVKvu80SVMbfBeFR8Rtg+5+gb9vvfgcUmIEDw3IEo4vgV7/6A7j/cCJ/hEA/
	xDVyFuYJRkEWgPkdH+39Wc1Mky9krQGtyJcs1K+5vmEAT3U05KxWTLYIEmN5Oj9ORU/Mh86LkhV
	xkQrYosyoT39ecV9j2iF+MOYkRvdKTWkt9vaWbdVEwJs6VShjBgAGlwbE1MCo6+N9jcceM0w9Xv
	iBV114Twr7MBCakvnIWNe37PbSnj7tC/A94/fFtZPqO0XLio3YZ1bY1CZl9veupzhYKGIela8gC
	fvZBKylIO6IgvX9Jw30wniePNUGVZpwB5dF3FtraWAkY1AUQNEAO0I9kUmRgfKFDtWMc64ebls2
	uwNevKNW1RT4+An1T1u/mWSWvnyvtvqRHoq4zsHjeIXuOwgJlVhtmI2oUxGRZkUT0CyPcxQ64Qr
	nRvhiYA1VpfVRR8zBUYbjcvByaTGoHwhp3ieQKJcYJA25NaGVAYHhiPc5j6tjbVw==
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr33060104eec.2.1792013890143; Wed, 14 Oct 2026
 14:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps>
In-Reply-To: <as_Cr4FhzyAh-kC4@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 23:37:56 +0200
X-Gm-Features: AclHuK8tgzioW0we3H5Jmz30FnP5L68F0LOvV3GcndlE9PwqCRYyUXS4gK8bCWk
Message-ID: <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:58=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> I'm following the specs[1] for these skills, and my testing showed it wor=
ks
> fine with a few of the more common tools.

What I mean is that they don't get automatically picked up by default,
e.g. Claude Code and Codex don't seem to.

The website you link (in another subpage, not the spec one) mentions
`.agents`, but not `agents` without the period.

So what I wanted is just to confirm that, at least between those two
options, there was no inherent advantage (or disadvantage, depending
on how one sees it -- I am not sure if it is actually a good idea for
all use cases to have them automatically be picked up...).

> We can open the markup language discussion, but I'm concerned that doing =
that
> will break some tools logic around importing these at skills.

Hmm... Not sure what you mean.

Cheers,
Miguel
