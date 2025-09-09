Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197725B1E0
	for <workflows@vger.kernel.org>; Tue,  9 Sep 2025 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441683; cv=none; b=Qtywestw9sARZ+zaw+AGymCo5+Nd4iczBaKsm1jdhmbS+8oI3cKSHIG3VTDaZJInGSoewWakNCrN2cnpTm+dIAarNct+hb0ZPrJCIPEHDmgI7URdanWUB+5jmdswHzwQKE0ramTEaxXL5XlMtPO/QlZTc9W3GixwREkEHYnZT+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441683; c=relaxed/simple;
	bh=uI1wjvIjVie1NesRLG312MngKxT3eOO8ZcLL/uPo1aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rxdk83jeUirshhS7eYzBXHo6HcujyEP4jVQ2u0lBRv2Y3fg++EiE4RHEwT047Ip0CnD2J9s0gEWSBuw3AWnK2IFHDKbRy/MZ0N1LslhWlR+eMq27So08tDw9+aNC3nesaUcIvBCvUTGf8Vjm9Y0h0xWXk5cB4syNvrvc02PjrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Pr0ujVPx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Pr0ujVPx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b042cc3954fso998924966b.0
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757441679; x=1758046479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vfO17BHW0rZfNCT/9fgYlAw+m8wHcd9WOi8933xChxE=;
        b=Pr0ujVPxUut2n+gUpYcLp9ufQo2akhalm3hFRK3QBBGXlD5CoWcogZJ09LbZ5hyTY6
         nAdgU1hAo8DvqJHChupnY3i5aiLBBhEHBxNYm1DJN65IYvDX14ymvzOuSI9EXn+9g/Lp
         EoyHVTrflYCkpeOLS3ePrwbsc0hiPyimCgpws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441679; x=1758046479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfO17BHW0rZfNCT/9fgYlAw+m8wHcd9WOi8933xChxE=;
        b=hjZxicEFyijUPYbwFIw+7lBd4Pgw5i/TtbvVRfeOQj/tilh/9aruJsY+lAVLYcLEza
         zHuG9iL9pJHdaXvWkhUDE1AvsDBcOtvOJmRcKClLNJb983NGFQOTycIcpNNrDOGwe6Rm
         cEEGZluG/NrzmFZlk8qJpvrBZj+5AFSp1WWtluMYmaSORG5PjEqcq+gZjcZC1PgZJSqx
         jRttvT79ZMtrfHk0Y7BaxdRUavKwXQZd/cTSeTwqzQ7fe+EEtpJ6WE0U+X7Xmn0YaQst
         BjVGsqcR4mm8nQ+YFTCV0NKYEiC8y8l+IKCZXKMRcEZnbrnD6malkYjz6BSeanqmHL5P
         4eQA==
X-Forwarded-Encrypted: i=1; AJvYcCXcItUdXmoSdxVY79Qb/5cEBHoIabf/gQqTkDq7Gs9lMdd2us4umDPkI63diiufbaAW6xvJGDQWFgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaaImElgOvP/CCIdGd7rXpukimWNMFdjt96IQKCAQc2+0z/7+L
	I+26VWTcuwaSzO7+7OeMkr1hy9oEh4muhC5cXBCv35kXvMiFtDxql9SpZDPvVVb6m38baSUYhuR
	B+FfVNXQ=
X-Gm-Gg: ASbGncu6kdV3vbJIiuu77TfQIFpRkuA/qA+YRTSciB6Kgi81zUQqQPOs8xmq0TX/T9J
	xFDv2Z9PQpVgmvpzNFfqEgSRjqIWbHaQZpVTZcDHmKQ+FTrF8snjJifi/9iEdw2IMQDAzLFzTE/
	FebArQdI2H6GJHJtYu5a6lUK8e9FFebMY43k2X8mSadlGvZAqSLG2bJ38NagigJfgDnbPklOhV6
	kEWf17VnCb5dYagHHoMrZfqnIiiBh9SRgBNqPPdwntWCVWbBpVutICWN+fYS+wBzGeqWbS8/fq5
	617e3S8TSZ/uD65ddtezbT2iW6T3eUOuTsbGsu0JBcrnbe4sRaeJ4UyRw8BIlG4/hGYVWXvxuS5
	YPjqiumtGcMdEwgL4JuUO5S3WsMWt8gYBc/GbSvWKGPtTcAOlXXH1QZqs6vZHfaujsH0hzPc2rv
	Zm9BR2IAg=
X-Google-Smtp-Source: AGHT+IHP42b0k33owhbQa7MyK5kGNAr4UhiPLzHmCnPqJPgtwrN1qfX7bBtqFqQ9BGk9BQYrDon9Nw==
X-Received: by 2002:a17:906:3ac6:b0:b04:c7c5:499d with SMTP id a640c23a62f3a-b04c7c54afamr749712466b.47.1757441678968;
        Tue, 09 Sep 2025 11:14:38 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078340e5bdsm28573166b.97.2025.09.09.11.14.37
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 11:14:38 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b042eb09948so1155335366b.3
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 11:14:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVghnLwIoZG+nuFgEMX3WU1lafPSovck1f8Iak9mnwQPkrwSNxeIWkNbO3pcRr4koYGR0sSOrp/Zxk=@vger.kernel.org
X-Received: by 2002:a17:907:9483:b0:b04:4786:5dfc with SMTP id
 a640c23a62f3a-b04b14aec52mr1479633666b.27.1757441677560; Tue, 09 Sep 2025
 11:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9ef87524-d15c-4b2c-9f86-00417dad9c48@kernel.dk>
 <20250905-sparkling-stalwart-galago-8a87e0@lemur> <68bf3854f101b_4224d100d7@dwillia2-mobl4.notmuch>
 <5922560.DvuYhMxLoT@rafael.j.wysocki> <20250909071818.15507ee6@kernel.org>
 <92dc8570-84a2-4015-9c7a-6e7da784869a@kernel.dk> <20250909-green-oriole-of-speed-85cd6d@lemur>
 <497c9c10-3309-49b9-8d4f-ff0bc34df4e5@suse.cz> <be98399d-3886-496e-9cf4-5ec909124418@kernel.dk>
 <CAHk-=whP2zoFm+-EmgQ69-00cxM5jgoEGWyAYVQ8bQYFbb2j=Q@mail.gmail.com> <e09555bc-4b0f-4f3a-82a3-914f38c3cde5@suse.cz>
In-Reply-To: <e09555bc-4b0f-4f3a-82a3-914f38c3cde5@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 11:14:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfWG+MHXoFG2guu2GAoSBrmcdXU2apj+MJpgdCXxwbwA@mail.gmail.com>
X-Gm-Features: Ac12FXyIDqMJF8_mBB-HCaVHrznKHzDDMIKV8gHotVb8Ejnx9UQuz0JOlJMmxC0
Message-ID: <CAHk-=wgfWG+MHXoFG2guu2GAoSBrmcdXU2apj+MJpgdCXxwbwA@mail.gmail.com>
Subject: Re: Link trailers revisited (was Re: [GIT PULL] io_uring fix for 6.17-rc5)
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jakub Kicinski <kuba@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, dan.j.williams@intel.com, 
	Caleb Sander Mateos <csander@purestorage.com>, io-uring <io-uring@vger.kernel.org>, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 11:07, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> Later in the thread patch-id is mentioned. I think it was mentioned in the
> past threads that due to small context changes due to e.g. base that the
> submitter used and the maintainer used to apply, and even diff algorithm not
> being set in stone, they can't be made fully reliable?

Yes, the patch-id is a heuristic. It's really a very good heuristic in
practice, though.

Also, if the argument is "it might not always work", I still claim
that "99.5% useful" is a hell of a lot better than "_maybe_ useful in
the future, but known to be painful".

Because that's the trade-off here: people are arguing for something
that wastes time and effort, and with very dubious use cases.

But yes: please do continue to add links to the original email - IF
you thought about it. That has always been my standpoint. Exactly like
"Fixes", and exactly like EVERY SINGLE OTHER THING you add to a commit
message.

              Linus
