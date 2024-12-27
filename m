Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917619A
	for <workflows@vger.kernel.org>; Fri, 27 Dec 2024 01:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735264244; cv=none; b=bgmD8aWXzLCgTqqEfekM9Xi44FAVsXvLxakOMJYDOF2EtJLa3hM5RZk3DXxZ/TUMtrccSFs9Yk5CrYqlwJz9mUqp5yOAZ6yzAYzN/eXinKOsPslvoV5QPr7l4zZJ6+fizsvcQTW7JA2IlYPmHA8nubhycpwACwILp/GCAwjJKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735264244; c=relaxed/simple;
	bh=J+sk83kBxA8PX3XMS6F3r7Q626WvQK5wAPcJ+Z847Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzWawpaQNe126+HG6eJixn5n1eXZfhMk26Oc/TX9EMuhPe6bXDVT8leXwPZ6E5GbesYDJoK224lh6j2UIndEzTpy1RGOOBaueGNIRjXQJq9QWFcFoK+Uy4LJTjXkHR71bkSbSVnqveuWz7KIYUCbg0NbWmjl1pI7Fh3n972PZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fFBLcITx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fFBLcITx"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso13226311a12.0
        for <workflows@vger.kernel.org>; Thu, 26 Dec 2024 17:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735264241; x=1735869041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kdOXV/r4Kvy1730Y09O+RKtKCgbqti+a4lbcvgD4Mz8=;
        b=fFBLcITxHRuJ25VegM1C3TanUWEGIPimEHXTEqqjTVOHwDrJpVBjOTLR0fJmbIv+tN
         clUSgZA9ER4qIhsmkmbPQo9gADH23FcZNHmr8AsLwa/JTajV+EDTotfVRieu8OS6ca++
         2ZqXNZcqXTb875mO/jjE2AMDshfPEm3xoouT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735264241; x=1735869041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdOXV/r4Kvy1730Y09O+RKtKCgbqti+a4lbcvgD4Mz8=;
        b=WMBR2CTO8rV7ZHP/Hn5yUo07XsvwwYJW41yJ8rvb0B96WqNi8y2C5YybunJ9vkJjFu
         ldYfOPc+UEtWmyjAYKH1Tbr5mL0R8GQFxS2ApySvtm+RceKZvPcHePDpmmssV4uuuzDk
         YPG3nOZURQmTvSBLhqcvqbnKp+MlpRnU0JlrfKa8Rftyk6nx7f77/d5hfeU9pu12zAew
         EfKCQOvKCMxKiU47FItxZYCNtVmEztUbFMjZ8WjldOvgwjA3va/Jbz4aoOUKZqYAV86s
         9VU16RuVM8DguAxY4R527jHqUBCM4CVsmTb3bW0rH51AgAZmwaSbZwxSVuVipg0zsy/j
         s+mA==
X-Forwarded-Encrypted: i=1; AJvYcCV0vBhPY4I4/NS7DrUku8t9igfGEFh7gqjJbnfGeWVKXCIAU6aaH++NS3h8Nj4LM29F0TjG/Es0z6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3/rkdZlDQ1prvZAhJXDXlnw6VTgaVVsKF8VreamyiB1jjo41
	YhTr2khse/FLmEwJ7tvN1XAsuObBSYFQOvj1diFWRfeSv6uL97lWI09f0ajafe1kQEOR5lgFtps
	Wc98kow==
X-Gm-Gg: ASbGncuzajH6WU1va6lZyNXuwUPZF1DEz1Tonz76ZHke+g64M6bp5WCgYLMe+USetJ7
	o0UryylbuNVKwalpJQ96aoCtC9EpDeJKY4Ud2xttpCTcQ81omQdye2/x7llKLwWhTc64yGkLIiT
	KOCwRyVhqYVaruXcX9DK5kjqf0RIU5hFTRLdGnWfl+Alr1P5QA0yzvZ3cjE0gCbUDfRV5J9YwPK
	JLbdzU8kJp27l+XU6D0UXbxXXSxViwTLcw868ugYNJ0LeA4Cljy7IFASTd4/M8PkAtS1VOgNKVT
	lQXbVFX8Nar+QDvgpTC7AismjIBH9ro=
X-Google-Smtp-Source: AGHT+IGAnII68nQD6qDRkJ/CRAc3fvc532B6c7oasOCq4klLxLTnGQBaeHHWdkVHTeekN/ypgEM57g==
X-Received: by 2002:a05:6402:2347:b0:5d3:cff5:634f with SMTP id 4fb4d7f45d1cf-5d81de48736mr23361558a12.24.1735264240706;
        Thu, 26 Dec 2024 17:50:40 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbbasm10365707a12.71.2024.12.26.17.50.39
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 17:50:39 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so219212766b.3
        for <workflows@vger.kernel.org>; Thu, 26 Dec 2024 17:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXiRAtck5Co1Fsc2lyRV/2sui8n4YO6xp53252RY2vkSTb9wHVj2vld2HmG8XkWFoT/x4NgEY1AtA=@vger.kernel.org
X-Received: by 2002:a17:907:980f:b0:aab:daf0:3198 with SMTP id
 a640c23a62f3a-aac3352c310mr2283149766b.40.1735264238634; Thu, 26 Dec 2024
 17:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226220555.3540872-1-sashal@kernel.org> <Z23ZmVwgS2ErX-dj@lappy>
 <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com> <Z237CwC_YKhoZubs@lappy>
In-Reply-To: <Z237CwC_YKhoZubs@lappy>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 17:50:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>
Message-ID: <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
To: Sasha Levin <sashal@kernel.org>
Cc: apw@canonical.com, conor@kernel.org, corbet@lwn.net, 
	dwaipayanray1@gmail.com, geert+renesas@glider.be, gitster@pobox.com, 
	horms@kernel.org, joe@perches.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@leemhuis.info, lukas.bulwahn@gmail.com, 
	miguel.ojeda.sandonis@gmail.com, niklas.soderlund@corigine.com, 
	willy@infradead.org, workflows@vger.kernel.org, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 16:55, Sasha Levin <sashal@kernel.org> wrote:
>
> What got me worried originally is the example Kees provided which
> creates a collision of a 12-character abbreviated commit ID:

Note that you can always create short ambiguous cases.

And in fact, since the way you create them is to just put noise in the
right place and brute-force things, you can also always make sure that
the one-liner short commit name will match the target commit too.

In other words: just accept the fact that a short hash is simply not a
secure hash. That's very very fundamental. It's just inherent in the
whole "we have shortened things to be legible".

And once you just accept that it's fundamental to any short hash, you
can relax and just live with it as just a fact of life.

> So sure, we don't have a collision right now, but going from 0 to 1 is
> going to be painful.

I disagree. You need to just own up to how it is, and more importantly
that you WILL NEVER EVER BE ABLE TO FIX IT.

There is no way to disambiguate the active malicious case, because the
active malicious case will just be able to handle any disambiguation
you throw at it too.

So the fix is to not *rely* on disambiguation, and to just accept it.
Don't fight reality. You'll just lose.

> Are we going to be actively watching for someone trying to sneak in a
> commit like that, or should we just handle that case properly?

See above. There is no "properly". There is only reality.

Git internally uses the full hashes. And any reasonably usefully
shortened hashes *cannot* be disambiguated in the face of an active
malicious person.

If you have some tool that you rely on absolutely to give you the "One
Correct Answer", then you are already broken. If thats' the goal, then
all you can do is give up and pray to some random $deity.

Or, as my argument is, DON'T DO THAT THEN.

Don't rely on some absolute thing. Accept the fact that a short hash
will always possibly refer to multiple things, and that you will
*always* need to have a human that actually *THINKS* about it, not
mindless automation.

The best the tools can do is say "there are multiple options here"
(or, more commonly, "I found no options at all, but maybe it meant
XYZ").

Literally.

To summarize: If you are aiming for anything else, you are bound to be
disappointed.

So aim for that simple "let me know about multiple choices", with the
knowledge that they are going to be EXCEEDINGLY rare.

And then if we have somebody who actively acts badly and works to make
that "it's going to be EXCEEDINGLY rare" be much more common than it
is supposed to be, we deal with that *person* by just not working with
them any more.

See? The solution is not some kind of "this cannot happen". The
solution is "stop accepting shit from evil people".

Which, btw, is not a new thing. This is how open source works. It's
actually way more work to create collisions in short hashes, when you
can much more easily just send a bad patch that wastes peoples time
without any hash collision at all - just by virtue of writing bad
code.

So thinking that the short hash is some kind of special problem is wrong.

It's in fact a particularly *easy* problem to deal with, because at
least the whole "somebody did something malicious" is something git
will balk at, simply because the basic git tools will refuse to touch
the ambiguous hash.

So *your* tooling should concentrate on one thing, and one thing only:
making it easier for a *THINKING*HUMAN* to decide what a bad hash
means.

But you need to do it with the up-front understanding that it requires
that thinking human, and is not mindless automation.

And as mentioned, the most common case of bad hashes BY FAR is the
"oh, that doesn't match anything I know about at all", as opposed to
"oh, that matches two or more different commits".

> >and my point is that this is really not about "disambiguating short
> >SHA1 IDs". Because those "ambiguous" SHA1's to a very close
> >approximation simply DO NOT EXIST.
> >
> >But the completely wrong ones? They are plentiful.
>
> Is the concern mostly around the term "disambiguate"? Would
> git-sanitize.sh work better?

No, my main worry is that you talk about short hashes (and talked
about shortening our existing ones even more).

When I really think that the size isn't the main problem at all.

"disambiguate" is a fine word, but only if you use it in the context
of "I have a bad hash". Not just a short one. Because the hash being
too short is simply not the main case worth worrying about.

And hey, just to really hit this same argument home: I can absolutely
guarantee that you have a much more insidious problem of "wrong hash",
namely the "oh, it's actually a valid commit hash, but the Fixes: line
simply got the wrong commit:".

Because that's a mistake I see regularly: somebody simply blames the
wrong commit. I've most definitely done that very thing myself.
Sometimes it's people reading the history wrong, and not realizing
that the bug actually happened before the blamed change too. Or the
bug ends up being a combination of factors, and people didn't realize
that the commit they blamed was just one part of it.

So my complaint really ends up being that anybody who trusts those
hashes mindlessly is going to have mistakes, and the actual hash
collision case MUST NOT be the primary worry.

Because as long as that hash size is all you care about, you're
barking up the wrong tree.

               Linus
