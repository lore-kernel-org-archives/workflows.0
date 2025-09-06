Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A271C6FFA
	for <workflows@vger.kernel.org>; Sat,  6 Sep 2025 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757186402; cv=none; b=HVaz/mkWGhUI59kYjyoXenB0D7uPIgq70gJ94whJPysTsCnG9TY8s+IZ9U7qv3oNgTweRRJtc+jcdJKbk4v/9K4rCon5HsWhRoR8b7YIzE2S/CFfXRR2FDutrBwkrNhYfUN+9AsbalhxkLutQkByh9Nnze7mAU7RPpP6XEmMZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757186402; c=relaxed/simple;
	bh=hYHMszme6h8QbWvH4Ei1/na8KCiKNvcEeq5inZjAvsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKp/QjyYr3LxFlFJ1w6EkCTsEXnRecy6hokJt6FZ0SOrf9aZS6vUjykS2NGOLaycMP/dYOAvv3ggyKX7V+icDVmV479XuMlDOzPQECljslird7xSc8FX5/SSbhN8Ig1/8JogsxVH9aV9Yb8+6vnXQL65XgJ03YTdhaXVmiTYtZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SEn6geXo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SEn6geXo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6263d0e4b94so714807a12.3
        for <workflows@vger.kernel.org>; Sat, 06 Sep 2025 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757186398; x=1757791198; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3PsyEfWtapZbpxI5NrN12+zjKIm+vlmcngHXhUnlngY=;
        b=SEn6geXo6NEI0kTydICvi4YBt6VRowVpdJdLBq2c4Iaz5MU/7edhptiabNtSF6eMRz
         SZnrKqppZZvOudSqcVcyBDrCFUCKTSseAMrwA16rOfL0xNqD7Lq9d/vgVCkhwAlEKK0/
         WGA5EYcxMuvjdISC+nM86QXz0tz6+OUVlQtLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757186398; x=1757791198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PsyEfWtapZbpxI5NrN12+zjKIm+vlmcngHXhUnlngY=;
        b=mNIQiBH++chJylWUyUWgwkUhg8TMQaFvvTXbrxna2ePWvAura1VNen157fWp9zp5xt
         +pstFBooTkhnSxcHuprWgrplqhyBpXp/855C9qy+FL15UnOt3Ynoxo0WrS06zLth6q0t
         B8Jckwh2IQ/tVhCTvI85ZVzUL/37A1pUdEoZcDZh/aqfUnuL6V5Vw4HUU5/zlX94gIbE
         DwqmAuwjPOGFfu4UUNhHxKqGykUC/16TtFPoIJLFCCZNJROGrUGEXVg8CrRPJNZaqa3I
         T/lmGRDSDk90MOrWzmB3hAPfkv2MK0DtpRrCiY0eA9aYPxzxlef2iE6pUKJ4+dBejnwh
         bjlA==
X-Forwarded-Encrypted: i=1; AJvYcCVzBHFmxyf8rpWz54n9NU/CckRj9NihkhE/mkjFZDn7WsTvy68N3uA13hS1Uq0JYm5THOTQA8KNZa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt/yEkcPiBQ9Yqd4JGWVUDuLPKV8XOi6TU7hemAV+sVdcoDf/r
	8rP8WPa83CvIVIAxFVOXWFR5a7pyIqkGlVJI/NvbBOH4nv7u8E3/2lDL30aSype2e2p+gfVy9Ry
	sj19ZVzs=
X-Gm-Gg: ASbGncs1JgrBK+Q5z16WdIU60suvsqJlm46mH+ET67yajWkdaUFMwUSO0qAAb9J46mb
	mMcb1zFI0XjBx7gnlyxO63JhxjOiaftgW8VXHaSQh460cPL4OfkyM/HXu6YIpAdbSZwbiAOCGXz
	8yiDO1RyeRJWOPkbI2yeHq846Eh0hCGRItpX80dSaniRtFwEtpJS3y8SxlH53Z5M+05yORLOHIj
	crp9iEXLwhiRy95xXWXoVrBunr9ekYYrs7c/iujCr5tKyNA50cTDQz8Pd5eFSqYFy98kVSB/tam
	hT0UQW4tIkAsVvp+p/7nPBC+lXS4vcc0d7MGPIrZ7vRMhWtnO52JfHWoDHRad1xjb8JdGcsioZJ
	LoHW4lbZfqK6eLoUV3uTYxwfWdY8dy8f1Yu8ux1oHQp9CYyqbV8oV5PRIIidgiu7mAX/zW7Mk
X-Google-Smtp-Source: AGHT+IFERvLmfWgY+Usx0eXy2dKeTSCDh9cw20RH6sqHJg8s9/szpeLdFRL6+7mUhir6lOaQlthgtw==
X-Received: by 2002:a05:6402:348e:b0:625:903:14b0 with SMTP id 4fb4d7f45d1cf-62509031707mr2189690a12.26.1757186397887;
        Sat, 06 Sep 2025 12:19:57 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-625ef80347asm1114893a12.1.2025.09.06.12.19.55
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 12:19:57 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61d7b2ec241so3770005a12.0
        for <workflows@vger.kernel.org>; Sat, 06 Sep 2025 12:19:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8EHjF75Lxnrl+k4BbreZYt68oAzIe9+8a5VVGiVXF8rQRmTLZX/lJwm4dKwSzJz4xilUanIYLffc=@vger.kernel.org
X-Received: by 2002:a17:907:1c10:b0:b04:1a80:35b9 with SMTP id
 a640c23a62f3a-b04b13cd575mr276185666b.12.1757186395623; Sat, 06 Sep 2025
 12:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9ef87524-d15c-4b2c-9f86-00417dad9c48@kernel.dk>
 <CAHk-=wjamixjqNwrr4+UEAwitMOd6Y8-_9p4oUZdcjrv7fsayQ@mail.gmail.com>
 <20250905-lovely-prehistoric-goldfish-04e1c3@lemur> <CAHk-=wg30HTF+zWrh7xP1yFRsRQW-ptiJ+U4+ABHpJORQw=Mug@mail.gmail.com>
 <20250905-sparkling-stalwart-galago-8a87e0@lemur> <2025090614-busily-upright-444d@gregkh>
 <20250906-almond-tench-of-aurora-3431ee@lemur> <CAHk-=wh8hvhtgg+DhyXeJSyZ=SrUYE85kAFRYiKBRp6u2YwvgA@mail.gmail.com>
 <20250906-macho-reindeer-of-certainty-ff2cbb@lemur>
In-Reply-To: <20250906-macho-reindeer-of-certainty-ff2cbb@lemur>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 6 Sep 2025 12:19:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjVOhd6xt0TiSakQx9jKBBveQr8GZiqF6Y6M9Ti1suw-w@mail.gmail.com>
X-Gm-Features: AS18NWCb9_SlpOIYL1sw9Hdpl73ZkQWu1tJwuck0jHTJiMgA7QLGMXslNk_Anb4
Message-ID: <CAHk-=wjVOhd6xt0TiSakQx9jKBBveQr8GZiqF6Y6M9Ti1suw-w@mail.gmail.com>
Subject: Re: Link trailers revisited (was Re: [GIT PULL] io_uring fix for 6.17-rc5)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jens Axboe <axboe@kernel.dk>, 
	Caleb Sander Mateos <csander@purestorage.com>, io-uring <io-uring@vger.kernel.org>, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Sept 2025 at 11:50, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> The primary consumer of this are the CI systems, though, like those that plug
> into patchwork

Yes, for a CI, it makes sense to try to have a fixed base, if such a
base exists.

But for that case, when a base exists and is published, why aren't
those people and tools *actually* using git then? That gets rid of all
the strangeness - and inefficiency - of trying to recreate it from
emails.

So I'd rather encourage people to have git branches that they expose,
if CI is the main use case.

For an example of how to do this right, look at what Al does. Recent
patch series posted at

   https://lore.kernel.org/all/20250906090738.GA31600@ZenIV/

is a good example, and notice Al saying:

  Branches are in
  git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.path and
  git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.f_path resp.;
  individual patches in followups.

in the cover letter.

In other words: if the series was exported from a git tree and you
have a base to use, why would it *EVER* be sane to then use 'b4
shazam' to get it?

So I think what 'b4 shazam' _should_ be looking at is when Greg says
"I like this a lot".

I think it should aim for supporting maintainers that apply patch
series as part of their workflow, not at CI tools that have the WRONG
workflow.

And yes, maybe fixing the CI tool workflow then involves having people
who post patch series post the git branch too.

I often find the git branches nicer for walking through some patch
series anyway. But it goes both ways: for short series, since I'm in
the MUA, just walking through five or six patches and replying to them
is simpler, for longer series that do more involved things, I find
doing a "git fetch" and then using git tooling to look at particular
_parts_ of the series can be a lot more powerful.

In fact, for long series that get reposted, just to not mess up my
mailbox I would generally prefer to just see the git branch over some
50-email patch bomb.

Maybe *that* would be a good addition for 'b4', where you can reply to
just the cover letter and say "Ack for this series" or explicitly
reply to particular patches - that might not even have been posted -
by mentioning their commit IDs.

That's my workflow much of the time, see for example

   https://lore.kernel.org/all/CAHk-=wgZEkSNKFe_=W=OcoMTQiwq8j017mh+TUR4AV9GiMPQLA@mail.gmail.com/

where I basically went through the series, and then replied to
individual patches.

I do like the "reply to individual patches" - even when I might
actually have looked at them in git - just because then I can quote
the part I reacted to. So I do think posting the patches makes sense
as long as it's not some excessive patch-bomb, but at the same time I
do know that a lot of patch series end up being of the type where
possibly dozens of people get cc'd, but only on the one or two patches
that are relevant to them.

And then the git workflow *really* shines, because it gets you that
context (and lots of people object to getting tens or hundreds of
patches in email when only one or two are relevant to them).

              Linus
