Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC628640D
	for <workflows@vger.kernel.org>; Fri,  5 Sep 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757103019; cv=none; b=nNu2cGj9YV57hqECqBSmolL1ykWPSjKcpa2F3E61crGxveW6Zn3xQbI9tOQXmygYCU+B4Kr7IDGktYr0+4wOUTSnNb22rt/g4DotaAkmdpDSWisKkFsVOXCggGx5TtgSkn2YhpZUJe5B0oQJqe6k+Gyfo8ZQdkZNh8dbs8007EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757103019; c=relaxed/simple;
	bh=ihZ/KBvVTM2viHT4uIXRQE2vVg3YunnikfyRSjOyZD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5Vs3wyp9I3s6H2NVsaexdBoDj54+vndZ2anpjzwfMc1seuRv38iAhNK7ACLQQxNcQc6C2PwDH7vjL6TB9e4EsN35GSe8ieAYm8Di08ulmIrStJUs46iJgVLXeD6jCSMB3QXoz5M8nfj0JwKjABoqLaBkVCY8nJeKrFKECx/HYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XiA6swW2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XiA6swW2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b049bd81ce5so193616266b.1
        for <workflows@vger.kernel.org>; Fri, 05 Sep 2025 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757103015; x=1757707815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xddsR/Pe+eD7cGTppeQ6zoun06h85L7v8WnJ4cYLHhY=;
        b=XiA6swW2YwGna0wpaiZQE6oStvn0paKdfaWmXPnedCWhxv3SUw9Z6ijTQ+68WNCM8I
         bkHhlTLb1Kkia20OdS44HHuC+/4aXPAC/E5pI5BUal4q72/8TtljxMRY5xGjgLxcZdtu
         USXIls/hFcVv8w/dd7pKgOsSjf1H63Q3yeMIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757103015; x=1757707815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xddsR/Pe+eD7cGTppeQ6zoun06h85L7v8WnJ4cYLHhY=;
        b=nh8nUasf+wgcFZTsMp+W8z/AqtBLPyqlqkqBVNoXvhvwEHSJv3h04w+EyvyPGccIxP
         fOJ3k9sKbfnXvf3EqU/u90hQTznvl8XH+VH9AEbu6v7RNGfXZK7kUpVZr7mvfX4XD7Vl
         exGZBathMXiHTig2R/nM6a+6aEukvqKeIpv/3TPYZcKmNQOQrEtW2Ki6JSqFU8dOFH5Z
         IqFlTq3GEjxuw50/vkNGVMDkhMKrqmJxQft/m2NbSh8t2LK/HpdgeyaJ4PI/L6E4O/h+
         pp3SS6Xm5Hr1YafyoSU02Vjp/1DS2fRESPNI+cAP8vT6ARkulaLHZ7ThjI50a95BkCkB
         kuUg==
X-Forwarded-Encrypted: i=1; AJvYcCUM+0HBNxPRAG8KbepEXCaVFFTDf9covP6sApM+rDbC43jeTNIy5VSU2oFyXK6LDvPqB5Nbz6+XONs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfAVIObUO0wF0bYa7dpODLZmH9rknAZTowzR2NccFzvDx61J4
	IKydCK9oy042Q0v2kbz3w0Pn3XU9nel2CihL4cQCf+SC2gtjhyU+g4EKDDoh6EoDJyW2JH4gCZk
	ZU+QO/VY=
X-Gm-Gg: ASbGncv5ogUq5+sZlObmy7lDFVaM+zPz/ME7zQpS3bWbAbG4lJnpRhyFm9IHJrfK7hj
	aac615t5o2X3eA74WOANXE8p04iWIO2yUcGY6shk5ALU4K9f+RDhr3CIVuHJByMqtQNM3a8n5X1
	Fd4d1NZTchnVi+EYVyY0WQwQxySBLEDwFj9Cy6O8IKZGyPRbCnxgn4Jf1ksIRWhUceyXGMrANEK
	71qzOhjZ+e0iAL9x6uolFEE4HX9m2nMyzhjubZp+lPuKQydvmbH5GGavo2xHFBzefTYAFzqk46g
	kGaNoXThG3MVRy0DgRA6Az0kqfiK4KbgQkOXymPlzenWxHwgK2Gd7eg+b/Ct8htaoXEdRR78+jn
	SD1sp4CBiSSc0LqX5TspuCEbS5A8MuQd2kjFWfQUx/iQJx8jJ4mGVXmBDY9Zw96hRm/G3B/wexS
	HkyssR1IM=
X-Google-Smtp-Source: AGHT+IFve9kmQ0HM5M4ugS5R//qLuYFzKH6UIdROMKi2e4RPQGtIUe+J+10n9MZYFlfRv97UTcWghA==
X-Received: by 2002:a17:906:d555:b0:b04:1cb0:baa3 with SMTP id a640c23a62f3a-b0493246142mr480684566b.26.1757103014930;
        Fri, 05 Sep 2025 13:10:14 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04110b94cbsm1521094966b.93.2025.09.05.13.10.14
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 13:10:14 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b00a9989633so473184066b.0
        for <workflows@vger.kernel.org>; Fri, 05 Sep 2025 13:10:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGkxveG3ULy9GtkdcmDwoRzv91kTsT/ZZv43EKUZE/ysoGRhApKyV+ysyOByYKDuMqSA/j8x3UhjA=@vger.kernel.org
X-Received: by 2002:a17:906:dc93:b0:b02:d867:b837 with SMTP id
 a640c23a62f3a-b0493084d31mr511145266b.7.1757103013782; Fri, 05 Sep 2025
 13:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9ef87524-d15c-4b2c-9f86-00417dad9c48@kernel.dk>
 <CAHk-=wjamixjqNwrr4+UEAwitMOd6Y8-_9p4oUZdcjrv7fsayQ@mail.gmail.com>
 <20250905-lovely-prehistoric-goldfish-04e1c3@lemur> <CAHk-=wg30HTF+zWrh7xP1yFRsRQW-ptiJ+U4+ABHpJORQw=Mug@mail.gmail.com>
 <20250905-sparkling-stalwart-galago-8a87e0@lemur>
In-Reply-To: <20250905-sparkling-stalwart-galago-8a87e0@lemur>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 5 Sep 2025 13:09:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh7_K-8HxSuxvYAOiWy+1UkVyOs5qPLdZEj5bjn+-7PnQ@mail.gmail.com>
X-Gm-Features: Ac12FXyvC8KlB-60GW4lzH7j8EzgCz1sz-rbVM2idRV4lq9qeYgMZVtZcK0__N4
Message-ID: <CAHk-=wh7_K-8HxSuxvYAOiWy+1UkVyOs5qPLdZEj5bjn+-7PnQ@mail.gmail.com>
Subject: Re: Link trailers revisited (was Re: [GIT PULL] io_uring fix for 6.17-rc5)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, Caleb Sander Mateos <csander@purestorage.com>, 
	io-uring <io-uring@vger.kernel.org>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Sept 2025 at 12:33, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> We do support this usage using `b4 shazam -M` -- it's the functional
> equivalent of applying a pull request and will use the cover letter contents
> as the initial source of the merge commit message. I do encourage people to
> use this more than just a linear `git am` for series, for a number of reasons:

I think that works well for more complex series, yes.

> This does create a lot more non-linear history, though. Judging from some of
> my discussions on the fediverse, some maintainers are not sure if that's okay
> with you.

I do *not* think it makes sense for random collections of patches, or
some minor two-patch series, no.

But I do think it makes sense for patch series that (a) are more than
a small handful of patches and (b) have some real "story" to them (ie
a cover letter that actually explains some higher-level issues).

Put another way: I would be unhappy if that model is used mindlessly.
No "let's automatically encourage this", please. That was, I feel, the
problem with "-l".

For example, just looking at things that happened today on lore, something like

  https://lore.kernel.org/all/20250905191357.78298-1-ryncsn@gmail.com/T/#t

looks like it could be handled very well with that actual merge model.
Just look at that cover letter: it has relevant numbers for the
series, exactly the kinds of things you do *not* want in individual
commit messages, but that make sense as a merge message.

That said, from what I've seen, these kinds of series are often MM,
and I don't think it matches the flow that Andrew tends to use. We
finally got Andrew to use git fairly recently, I'm not convinced
getting him to have a fancy non-linear history is in the cards.

(That said, Andrew clearly deals with series internally, and his pull
requests tend to actually describe things as such, so maybe he
wouldn't be too annoyed by something less linear).

I would worry a bit that  people would use odd merge bases for this.
Because one of the advantages of a linear history is that it's
simpler, and in particular that you only mess up the beginning point
of that linear history *once*. And yes, people do mess that up (we
have a whole section about the whole "pick a good base" in the docs
and people have gotten it wrong).

With non-linear history, there's just more complexity and getting
things wrong is easier and can be even more confusing.

So while I do think do that "b4 shazam -M" can be a very good thing, I
also think it's something that *definitely* needs a fair amount of
forethought.

It should not be some "default flow", in other words.

                 Linus
