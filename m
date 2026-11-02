Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647885;
	b=Q4312f0KU0weBuJP+cgv2jzCBVdzEh03fQo8u4QjluPhHHRboS2lr7rHRBPfHiYEa7gT
	 vukyuHEyceA1lTMLr1hhCy0TvwbIeGOIhlfmQHrXleHPseZrHA7TBBOd6pV3zCxFS4OHu
	 tqVqdMQaCGrouvsqp73O0d4kVAe7eaQXmYkMNfh9CcYEz0n2p6M14SoNVb84B6aa5ZH/T
	 tEqsozrLB9NQ5Ew2Zi8AVobrK4nHdh9aeIUD+SNztKCat8yL5AzlykypkSQo/RQcNu2My
	 uhFi0ZeYk514QhLFpKd/hqseVQoBONceCEZJecIAnpnRg5b7CPwGs40m1KVPCYpJkFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
	b=AUhADHYnuYlFafUIrb0yorzalgBLKnFQ3xgK0C7JRLQ/aHVSTCnMFs9zXWLuIH0YPu+5
	 ZPq4P/OMz8mmgDC9+lvaIuSvVlmVni/JlokkZS6jJx0ipZp6vxqM+3ycT1zVvHKoZ9xmT
	 TO9lkP9KoXBsK+M/TVF3KepuOmu2CiGoitSV6gVJz3oMWuGYGz0m/m5U5dhf3hkaDquqy
	 EIwG6KVGruac6Rey2+hndAErYqF7a2R4km/dJbrLuZoQTW5Vtaz506MPMcUds981XLmSw
	 HeL4lRZNGVnOnAFkvygX1snbUNNz38yDM0qhFtIAJK6j+K9gFRjZsEyG0XzkC/LqM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l73LkrQv;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5EE606A329
	for <workflows@vger.kernel.org>; Mon,  2 Nov 2026 19:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l73LkrQv
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so20987635e9.3
        for <workflows@vger.kernel.org>; Mon, 02 Nov 2026 11:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647883; x=1794252683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
        b=l73LkrQvuZciKzRpKr1DfT+CyrRl3sJ4ez5tHIOziCKKoB/NIWjlFJVqceOemEeFiP
         9SZFYkIhtEQg6AQWUQiCd4HhIzPr6VFPJ+5Vbr01oA7qHVtw0gzlRhch5jJkngznqgv8
         Innt0EQ5E4l41nWAGtL3GUUDl0QU0hdckMOYKnucV/07iQswTt6jNpTLvLjxUQxSXrbh
         zYXtDsW1Q2yBmCnUClnpBVLX9t4yeOpGJzwi2YkOZPxnRlK+4t/ju8kpdbOKLVbooiul
         yi8Ys8kz8IYBi/UvG7xllQbO+R2I006wPSIzT6PGGxF8IEz4JS8+g+mktXlAP4+K8h3v
         ldFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647883; x=1794252683;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
        b=wdhgItZ8fpDWCCT04JiaHFYyMEl7HjbAgxYCR65mi/BBl01pT4MByVsCIpuANHvr8j
         b8zWDxDkXg/gB35EOLMU9AZ4ciN0SbhxZQZlMUyMK95FCWzICROUasYEvL3Kuk+RR7ut
         kiVxfKsJNYZwEyUtuLXN8Koq1HT5U6I4d9TNqLj0JXetfcx1w5lUrKn6GqqLVUinCLUI
         xX1HlQxBi/rHCK5tSHv+jMyrNr42qgr8jufBVgjDvT5LyUBdaXyngC0mivgilwvwuvt3
         2zdiyx0o9aBcBYEdvViQ2UHRJQyavsngir1O6PEPgdqfFC9Jphlu6a20NXZgFqi8gCKW
         d27g==
X-Forwarded-Encrypted: i=1; AKwUvBweDyo5ouVOqSCkg4BrN6GbwkoDiqfAewAVnfHaAkg78u4t9thfXaEOpyP0YuYIXk1PC8nakUhwCq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZHnthV5TNqum6ir6QqZwdBJ5jLM4pw3OIvYsIjRB1hJS1pN00
	RJ1rgz0MB/cDJkFg7S6zjrji33g0Ygb3eW/JJ/OOs9p9OeILyCEnHCQe
X-Gm-Gg: AYBFou2Ud2w2ZK5lwhgFsgBs6LJSj7x4wUFAIoBCpluC7dh4jCWQdQXNWOEpe9KJ5GR
	LBlimHGn65L5O3nQxT8KtJqYT0Qaz3Xxvs1JxVxEvMpD3oX7Z7BnGRlGmO1AY2Cd3eE7tkv1dua
	uxukWlUOJL04rAcU2CfmHMAmHB/c/hymX5DL2/nrbJ8Kg2pSkLCAaA/nzI9O5FQk6mGFa5f7ZAG
	x8zcb4/0c2IqXVkcNwr4si+Iettd1EskLy4c4fhj857yKlW0I/xv+9VbJTfF6Pkft2MXOGreeTy
	a02PbwgUrBhP9I76hZ8yFezj3FULV7ANjY2ZNUUNKKtlRZ52PZP+A5BAzkxJRKA+8BE0Nqv9ci6
	gfTxUZbL8ckaVihawLRWitTctnHxIzUXfNPzkPqS3hVH4IRJ64CXuIC+iNuwS0na2qL9MJZHvPl
	A2yWWO6AHDQ9w/lmWKohYfZtMzOCnqeA8mfLvIONvk09I9z+U7W5zscuUALC0JJyqUDfEZqmEP6
	zRLiEjvgMuGYsmFUdiwg14rrZdgB0d+0NBAgoQWAU2xXC0yD+/bniFIGIb+23tx6CWRBb4vRqGS
	OtE732La5xab+CifD3/mwfjVr2T2FopAGXV+LHGHML5uP50hlB4yqmyN7G3AvGUAXCmhyJJZmM3
	3/+8WpAFIhw==
X-Received: by 2002:a05:600c:e555:10b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b261e5b38bmr21493425e9.11.1793647883361;
        Mon, 02 Nov 2026 11:31:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm9940525e9.0.2026.11.02.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:31:22 -0800 (PST)
Date: Mon, 2 Nov 2026 19:31:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Corbet
 <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Joe
 Perches <joe@perches.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102193120.4c88f066@pumpkin>
In-Reply-To: <20261102-affable-undetectable-beluga-eded3e@meerkat>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
	<20261102150535.6c5689f6@pumpkin>
	<CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
	<20261102-affable-undetectable-beluga-eded3e@meerkat>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 12:56:28 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Mon, Nov 02, 2026 at 05:24:51PM +0100, Geert Uytterhoeven wrote:
> > > I certainly scan it.
> > > It is also useful to have an archived local copy that can be searched.  
> > 
> > Indeed. Sorry to say that, but Gmail web interface search is still
> > much more effective than lore web interface search.  
> 
> Folks, I don't want this to turn into another thread of "me too" responses.
> 
> Yes, I know that some people still use it for a number of legitimate reasons
> -- but these are few-and-far-between exceptions. I need this change because
> the current status quo is NOT TENABLE. *Everyone's* quality of life is
> affected because Gmail's throttling results in (looks) ~350,000 mails in the
> queue, most of them waiting for Google to graciously allow us to talk to them.

They are actually waiting for gmail to reject them so often they get deleted.
If you try subscribing a gmail address to lkml it really doesn't work very well.
Maybe you get 70% of the emails (hard to say) but they all arrive out of order
and sometimes days late - makes a real mess of patch sets.

More interesting would be not sending any patch emails (and replies to) to
gmail addresses.
That isn't as harsh as unsubscribing gmail addresses and still leaves the
gmail addresses getting any 'admin' messages.

> 
> So, we either unsubscribe all gmail addresses from LKML and prevent them from
> resubscribing, or we do something less drastic and revert it to how it was
> supposed to work in the first place -- only patches without a dedicated list
> end up on LKML.

Then those of us who want to see most emails (or use local filters) will have
to subscribe to all the lists we can think of, and then handle the fact that
we receive multiple copies of emails that get sent to multiple lists.

David

> 
> -K

