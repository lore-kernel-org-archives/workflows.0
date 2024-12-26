Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3D198853
	for <workflows@vger.kernel.org>; Thu, 26 Dec 2024 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256037; cv=none; b=mtfVdIEUCT+QVFniTRzlRT28jKdhEaVgQ+Gd3j+hwqW3TkYVbxqqoPYq5DWmbsSvrw5bN7RW9ndVXfbu9VCLtN4UPen+hl2H2l71aKBvT+3DVYsU1Cf/i0kbPwa7NkYo8/UVl1vjV2Vbqb0Z1kv5DAC43Y7bxca6m+NRPaMBxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256037; c=relaxed/simple;
	bh=d+CZ3SZlBj7TBEObKis3PhKAlEPXdisrDlCGOf9uZsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raRyahFSF2MH2wpjPmLrdAOpFaWeiahBQelYl5C+kjAA/8fMLW0m/OVC8I1khryQ0RSqhEHs+FVxAGQcEGheL9XfyyI+IstguAmdeCdFNBk8bSWQGWgJfgO7zg/iM4ioyeukWM2lckxIIre3haUD7FxFyJjY7K7pUfGg0RXdiVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dVvcKcg8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dVvcKcg8"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so11661340a12.0
        for <workflows@vger.kernel.org>; Thu, 26 Dec 2024 15:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735256033; x=1735860833; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OhTSnk9OWvmDG1Z/aUUbSC3WhUfhNvnWmedEshCi0=;
        b=dVvcKcg8Cxz9jvz3dxNtf377nmVL9YPW0665ZsFbrOJFmQOo5wyxv96Od5TW5QfTOl
         B03CEeJhQAFQw0sent85EAFF7Kib0Mc0ZIxpL94kMtDY6opY4k7AuDKxWcbRYoMlao/e
         LG4hfXtlO7RVY+ED73t5C+VvQbQZNH/IP+qdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735256033; x=1735860833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3OhTSnk9OWvmDG1Z/aUUbSC3WhUfhNvnWmedEshCi0=;
        b=SQ2YRA+wos7H5AZfSFB5xlAbqDFElFks80a5ZWabuP+cQt96q5Ai8vi6fiWMu5V0Es
         soUEqC8C5Z5IoA+JNQkGeS5Wr5eVu+TAYG/kbwg9HQC/pwMGDAnDyP96BNOgAHwoiA16
         BRx58F+zizpQhh8rpba6XQfAJmfB2sJ9bZRjdsaJz10ZdYn/rZJqTBf3Es8gVh/lfxLC
         IqZvt39AiIPlcGueJMzTJkiJha4npfZ89sDAU03yVejUnJI6+JqPk24Vc4tpcx6L54v7
         JHC8j6d7P+T/TkvUIUtBxzslNasZNdaLo5p9Nfri+6mmubD2JqUSimNgobaux95Kp3em
         y+bw==
X-Forwarded-Encrypted: i=1; AJvYcCWpZ5NR5xkym6knra1HFnfGoEyKmRCYraISRZ7w07DA4F6ASOeKWNSW64Di5bzJnTZrR60CLyeiZM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjlUce5GOLmXQJVNuYbld23EWaoqiLi8e5Tstl6vV2J7G8gbn
	ep/YR7TBywogU3VFOMwetRZmLrbOOltg9/gAAdl/coH4N18CCu3/AEx8Vu7p0XgnCT7bvZwXiJ3
	+/XlZXQ==
X-Gm-Gg: ASbGncs4A2GBwQBeEsEwWn5NUU10Jim2jP9Itt/DE34NLqmLEBbCaFs7FPmFpA1bgeO
	WmmtJyA8tVH3VsLkpFHcy8ALfoJdUF3VD253xkTHkj69me4IGcQiJwTg5Yl+Wn2V9xqiYbG/Dl/
	b+9d+6SIiUN3JO6CdsZU5jnk3GXpsHtBCAKtgdXDGP/Ux40Vx2qoQfojAVlIwKAGAXpXiIMtFMn
	FoBu/4qxiN+BRg/TTrCxeUkd5AIzKBGxtG65uJPkNGN9Pj8voraqP1mB6E5b0JwceTDsWnGw9yC
	pdZYt+EF2Hs0joDuRY3S3GXi7VyuCAM=
X-Google-Smtp-Source: AGHT+IF8RXY7UcOOkROzrqvQ4bTH/e3onP9pteKHE2QEZN2+eKistXInrnNynL6FaoktJkETMMtKOg==
X-Received: by 2002:a17:907:368a:b0:aa6:b473:8500 with SMTP id a640c23a62f3a-aac3355fe3fmr2088570166b.42.1735256033486;
        Thu, 26 Dec 2024 15:33:53 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae4369sm1030894366b.87.2024.12.26.15.33.52
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 15:33:52 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa6997f33e4so1159524266b.3
        for <workflows@vger.kernel.org>; Thu, 26 Dec 2024 15:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjCRwvhw3LJ7AC+pTtuWcPv4WkTyT8JqpfUKK+fXRuK5IkmQgpq0LmUeAmRQvQF9DrR/oghkFoDIo=@vger.kernel.org
X-Received: by 2002:a17:907:97d0:b0:aa6:2c18:aaa2 with SMTP id
 a640c23a62f3a-aac2d447071mr2323414466b.27.1735256032370; Thu, 26 Dec 2024
 15:33:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226220555.3540872-1-sashal@kernel.org> <Z23ZmVwgS2ErX-dj@lappy>
In-Reply-To: <Z23ZmVwgS2ErX-dj@lappy>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 15:33:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
Message-ID: <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
To: Sasha Levin <sashal@kernel.org>
Cc: apw@canonical.com, conor@kernel.org, corbet@lwn.net, 
	dwaipayanray1@gmail.com, geert+renesas@glider.be, gitster@pobox.com, 
	horms@kernel.org, joe@perches.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@leemhuis.info, lukas.bulwahn@gmail.com, 
	miguel.ojeda.sandonis@gmail.com, niklas.soderlund@corigine.com, 
	willy@infradead.org, workflows@vger.kernel.org, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 14:33, Sasha Levin <sashal@kernel.org> wrote:
>
> Which means that folks should be able to use a fairly short abbreviated
> commit IDs in messages, specially for commits with a long subject line.

So I don't think we should take this as a way to make *shorter* IDs,
just as a way to accept historical short IDs.

Also, I absolutely detest how you made this be all about "short IDs".

As mentioned in my very original email on this matter, the actual REAL
AND PRESENT issue isn't ambiguous IDs. We don't really have them.

What we *do* have is "wrong IDs". We have a ton of those.

Look here, you can get a list of suspiciously wrong SHA1s with
something like this:

    git log |
        egrep '[0-9a-f]{9,40} \(".*"\)' |
        sed 's/.*[^0-9a-f]\([0-9a-f]\{9,40\}\)[^0-9a-f].*/\1/' |
        sort -u > hexes

which generates a list of things that look like commit IDs (ok,
there's probably smarter ways) in our git logs.

Now, *some* of those won't actually be commit IDs at all, they'll just
be random hex numbers the above finds.

But most of them will indeed be references to other commits.

Then you try to find the bogus ones by doing something like

    cat hexes |
        while read i; do git show $i >& /dev/null || echo "No $i SHA"; done

and you will get a lot ot hits.

A *LOT*.

Look, I didn't check very many of them. Mainly because it gets *so*
many hits, and I get bored very easily.

But I did check a handful, just to get a feel for things.

And yes, some of them were random hex numbers unrelated to actual git
IDs, but most were really supposed to be git IDs. Except they weren't
- or at least not from the mainline tree.

For example, look at commit daa07cbc9ae3 ("KVM: x86: fix L1TF's MMIO
GFN calculation") which references one of those nonexistent commit
IDs:

    Fixes: d9b47449c1a1 ("kvm: x86: Set highest physical address bits
in non-present/reserved SPTEs")

and I have no idea where that bogus commit ID comes from. Maybe it's a
rebase. Maybe it's from a stable tree. But it sure doesn't exist in
mainline.

What *does* exist is commit 28a1f3ac1d0c ("kvm: x86: Set highest
physical address bits in non-present/reserved SPTEs"), which I found
by just doing that

    git log --grep='kvm: x86: Set highest physical address bits in
non-present/reserved SPTEs'

and my point is that this is really not about "disambiguating short
SHA1 IDs". Because those "ambiguous" SHA1's to a very close
approximation simply DO NOT EXIST.

But the completely wrong ones? They are plentiful.

For a completely different example, we have

    ec680c1990e7 ("ide: remove BUG_ON(in_interrupt() ||
irqs_disabled()) from ide_unregister()")

which has this in the log message:

    Both BUG_ON()s in ide-probe.c were introduced in commit
       4015c949fb465 ("[PATCH] update ide core")

and it turns out that that commit ID doesn't exist in the kernel tree.

It is actually a real commit ID, and it *does* actually exist in the
historical BK import by Thomas:

     https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=4015c949fb465

so that's an example of a cross-tree ID, and yeah, it might be really
cool to "disambiguate" *those* too.

But again, the problem wasn't actually that the SHA1 was _short_.

            Linus
