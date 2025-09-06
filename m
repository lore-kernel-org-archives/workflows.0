Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5CD1D63DF
	for <workflows@vger.kernel.org>; Sat,  6 Sep 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757172743; cv=none; b=tC823bikc3z2kZqDZB6Re7cDIyu/JkqOkog8tJSO1zcIM3COeGa+Rto/VENGYLYbEng/wYU+hEj78WMRxHpCP386DW5tfk0Y1h6A83a1DBRBjWl6hY02W1Xpf+z3s0V1rkSVV+XKnBqPs8//GquljPfylYysiOO9/ZVmmE7ToWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757172743; c=relaxed/simple;
	bh=xKkl3DI8ulz4vlyTXEnWSAZzTPv6U0YxG+xFkiOc4Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqIX80g1v75O2xLGDM3QMxOJMIihXIsO9If/PHbRNpxt2NzJa+lknq8PjHrPrMIHIef06K7SEHqdvEHGVH5rjkqb7Qlphi/EhAAldyt5gOiA/VFkDkf7mCQC7+8tLHLxKkxtNm+mQ7m42VxTG+C1h9yMbWSGCRynHrE5/vNGMKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TArWZeoR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TArWZeoR"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so3787634a12.0
        for <workflows@vger.kernel.org>; Sat, 06 Sep 2025 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757172738; x=1757777538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lncXm2cx4UB0yoqFu06gxrKnTE2tWicGtIvZ9ZZAkv4=;
        b=TArWZeoRwTJ1Du93XteU1lNesL7+CLqJMuXAnTIODhNbvT/ZXdNpX0w/ZyvYJhK7qu
         oLELHk+ARF46uUv5yDHNTgQHK8IEjRgJHZr1Du7uB1e4lAsVNUW5nZUK7k0EkwCWrB7Y
         w3cJ7N9nZrMeD5vUxGQhh91gMP4pN0KDGep8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757172738; x=1757777538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lncXm2cx4UB0yoqFu06gxrKnTE2tWicGtIvZ9ZZAkv4=;
        b=JO2h28iOhJixoEFm+yGv7SSg4E0HeXVp5eydm3FhwaaZedh3H/PXLd1dW36SaaH8r5
         JqBp9CFXWymsxx/iN8tPnWS9GIa0q6u3T8iuv//6kRnx6V/bdayjkwu22MnzFIoxCaOJ
         Kpryea8/pVg5QXsbmZK5oRQCq5MKv+Rp26bvrARAfghLVMxFQekBQ6vP7IAzwJbAs3gI
         VbGfZOO9xhB5YOuu7CD90/Dcy/b0osFjEl4NlW1aTq1L/+QzmFrBmo4j7ZrDMPkbtvQS
         TOr3JJGKhaNepom7Vhyil6ijTNSC5n3fyHaHFehij/qb9e2oMDxfHOrXLVQYIXON+gLs
         /fQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnne37wDik/vO9Q8lxa/WaFampgtgPwy0Q3sExuDAurPftzKjkkn3znmOTJc+Varx/Y0R8iA77Bjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQV5Rl9BUQvzlE/7VuuXDPZiJ2FFJlDdkxXEKCB++UgoQ9lYX4
	bj5HvnVZheFxtgr/hRE5sK7hZQc5c/dat5UTraNrK2XS+MvEL8txg6pej1hrLqsbSRKOCWfX0gm
	YcZ2PwV4=
X-Gm-Gg: ASbGncvBctR4f6CmR4VNYziuhGx1lIh3oLKFitX4O4oGOn8fz6k1PxACDWJcUeXc3F6
	k4Eg56NUxwkPOrtMr0jZFOBOfFz58KCkQKXDIBjaev0SfJEx6lQ1ycDdMHQrFQ/bKsGR/n5WVa6
	5Cpli1L8CfbpNH2+I597PEM2xCYinUPJqpe/AhljtU5hna7vIoeo5bpnu4BKQIAPwfsB+XZCvgu
	FD4p2qWWylsvxHBvvTbZ8iahhVekyA4ZCDVxEn73SvTtExyFswYUx7qoaGhQApElOtFZgusTv2y
	A2AwQsDPsmh8SkmX8OJKfcmZ5DWmGdi5IBt9RC/A34eStcMK9u66wjqV4528bltGjgJyA5LpUIh
	1xD8LaO5yz5+BBNOkjCG0oUjvS4kaieeloPs5Z3l4VOVd36A6fzUtq/1dKxVAZt3kkrs+GUaW
X-Google-Smtp-Source: AGHT+IECiTjTtOYW4PzNCfyeNQ/nHZBi20c1SU8KuP7RmIJKTC59Bs88CNlTMsrZiTj1FGljxLjKoA==
X-Received: by 2002:a05:6402:1ec8:b0:625:fc4c:567f with SMTP id 4fb4d7f45d1cf-625fc4c5725mr1098570a12.18.1757172737911;
        Sat, 06 Sep 2025 08:32:17 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm18414553a12.44.2025.09.06.08.32.17
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 08:32:17 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so3787615a12.0
        for <workflows@vger.kernel.org>; Sat, 06 Sep 2025 08:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8OhmtFyR2Ze4wf2vBCHpo5Bg54lkYNiMDd0aYLPofWjx6TouCucywNZzVARRV6oReuOKC3ozHxyU=@vger.kernel.org
X-Received: by 2002:a05:6402:2682:b0:624:591d:42b7 with SMTP id
 4fb4d7f45d1cf-624591d47e4mr1934878a12.21.1757172736702; Sat, 06 Sep 2025
 08:32:16 -0700 (PDT)
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
 <20250906-almond-tench-of-aurora-3431ee@lemur>
In-Reply-To: <20250906-almond-tench-of-aurora-3431ee@lemur>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 6 Sep 2025 08:31:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh8hvhtgg+DhyXeJSyZ=SrUYE85kAFRYiKBRp6u2YwvgA@mail.gmail.com>
X-Gm-Features: AS18NWBgyVz1-mW-WIhIbKz5dg1cwF2msJfKl3srmWO6iJRnqem-dLPENbf07RA
Message-ID: <CAHk-=wh8hvhtgg+DhyXeJSyZ=SrUYE85kAFRYiKBRp6u2YwvgA@mail.gmail.com>
Subject: Re: Link trailers revisited (was Re: [GIT PULL] io_uring fix for 6.17-rc5)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jens Axboe <axboe@kernel.dk>, 
	Caleb Sander Mateos <csander@purestorage.com>, io-uring <io-uring@vger.kernel.org>, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Sept 2025 at 06:51, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Unfortunately, `shazam -M` is not perfect, because we do need to know the
> base-commit, and there's still way too many series sent without this info.

No, no. You're thinking about it wrong.

An emailed patch series is *not* a git pull. If you want actual real
git history, just use git. Using a patch series and shazam for that
would be *bad*. It's actively worse than just using git, with zero
upside.

No, the upside of a patch series is that it's *not* fixed in stone yet
- not in history, not in acks, not in actual code. So do *not*
encourage people to think of it as some second-rate "git history"
model. It's not, and it would be *BAD* at it.

Instead, embrace the "it's a patch series". You should *not* strive to
make "b4 shazam" think it should recreate the original git tree. not
at all.

Instead, it should be a "here's a patch series with a cover letter,
make a pretty history of it, delineate it with a merge, and save the
relevant information from the cover letter in the merge message".

Look, we already have subsystems that do that. I don't know if they
use b4 shazam - maybe they do, maybe they don't - but the end result
is what matters.

For example, the networking people use this model for small series of
patches, and you can see it in patterns like this (I picked a random
area, this is meant to illustrate the point, the commits themselves
are not relevant):

    gitk d2644cbc736f..f63e7c8a8389

and look at the kind of "pseudo-linear" history, where small series
are delineated with that separate branch and merge, but this is *not*
some kind of global history where people tried to keep original commit
bases around etc.

That kind of global history would be *worse* for the whole "send
patches by email" model.

So don't strive to replicate git - badly. Strive to do a *good* job.

Your comment about how you want to know the base commit makes me think
you are missing the point.

git is git.

And emailed patch series are a different thing entirely, and trying
for some 1:1 thing only makes things objectively worse.

                  Linus
