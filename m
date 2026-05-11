Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A73A4F51
	for <workflows@vger.kernel.org>; Mon, 11 May 2026 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531701; cv=none; b=L4DPfLx5g/7DAcyJ1kw5fia3uSaruycfRNlBcsWny1/LgIKkX3llL+tHuTJKXJUhlYwVhJBX6iSsGl7CrVabAvtQhKd5N18Y1JBN7uOQM9FmUY3ZVAy0+hEzj1TQOJeKkoogKlTjJgdyuivOdzwk1y0hC1re1GpwTJ6d1vHyoKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531701; c=relaxed/simple;
	bh=tYRtTOy1sHxq4Rk5XvcIzIiOnuPKAFIZOrQMkYea6rw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4zI5vduPQLH1FOzLHDwysavAASVbnzv+zghfLtV5Wr9juznVgy5rXK6xxTyFldNawW/cgtY5NStW0B8SjztnpizT5kJXpzB6nijdFjaCrYqMEiI46NzMvXiTGWwbUS5Fif4/ce+Q/TLW7JS2S41RNnCvN7/kfWqcA2PpiIImbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLcK/Or6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLcK/Or6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso33108865e9.0
        for <workflows@vger.kernel.org>; Mon, 11 May 2026 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531698; x=1779136498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5xopMfEr6HUMHZClhAXHEE+h7URb7mb9soskalU1hg=;
        b=tLcK/Or6NZzRstHbLTu2se61PyVivEyWF9oYzxtyiDW9myOMgQ6YdfFN/3vNCFYCbb
         DW24naCKzLabB/Ng6jCZmSZ7Wb5DA1f532esE6hZr2wV6jmdLXw7VE3ARyR6cZYzeTR8
         hQSkr+m+hZ1V41OLQKRzBw3kpKdVxNiI7BzC7atUKswSEbWbd3cNhAXocmofsKw4gNtR
         zeW6MBGJIPvuyaW+gCaSEMpEQ8vny2MOfY+pL7rUYDLoYSeu7tN9XqaGiusyjN/+sumU
         R0IhdrMgju8QezpnwZzxkXodoHyqr291O1PriMemqMrJ1gHFwAcPE1IRYOANAh2455iY
         zCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531698; x=1779136498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5xopMfEr6HUMHZClhAXHEE+h7URb7mb9soskalU1hg=;
        b=bTMJ2H6zGKb37z2GPz8ZKuOZCo1MtS8kzz4gOA3aaADzhHXFH0WibAFOe0+YYofr2Y
         Vs7gAr3tNrwfgQRcAzNloMxA05gs7fLx/KJRM6i0LrQLDvP02Erv8fI/4F7GsL84WiIO
         hEiPpgvKeMpOX3go/E+glMCtQhXByG8eYg72fss3+SsvxxZ+uzFRkj2xF0BZim7JKUdd
         p2FFsaQuRu9oFPukllEYjizn84ZcSwsmuO3TfN+5D3yh0jYI+gSTCLMQ2RhAA5z3c9Y6
         LkubZM5QPWmUQhFscbiyjJ7tgfQHbn3P5auZlr6wiomJYjmOKH0Iexg6f5eK6seS5SUe
         Yyag==
X-Forwarded-Encrypted: i=1; AFNElJ/15irIwA1cakDkJOhfWINRHS/DCdq9m3BJLI2EI+/l+ZH13146PIiJenPlaGK9cWjkRW09rrpw2AY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9BAlE8ZuIrP+br7nzm9Al50taMOn9rtaWFe8Hkh7rItlPT/gr
	v/THxNh5PDGTSxmSAx/etfVLKmIemzlriL1vud4JzbbYGDeJTQW52lHl
X-Gm-Gg: Acq92OFxksDRMA04kGJln9TsShSo2U25iif50MHSMcqmfw+w8maOb3QNho8Eog1lWy8
	Y+9mQNQmMqG4607yRJfai9NhlzvtNsZLL4XXmiK+PnABSs9SExSiUNq0bEQ8WmElCt4PLbs03ET
	0m5G+q/iieP/eLw8BiRtqWTZK2bibJZHfumuSMXQ1D0bSuJv9kMwDxJDKcHbuEAlDyBP/JVD28s
	dHdPbSo5YGYF7kwdfm9QwY+hwbijN8cvA+GYgM/pZ1HmBcRuq3jrrK/kf9WyYWSvqQoedVvLRP4
	nCXKnxvO9UvwZEUx790u8j0Zk/wGWZE47Z5S+dORtPccnqxlZVEbTH4kXzJYZCQb7xTXehltakC
	5p6nqcYzmw3WytKlxYpmCcgY0choFUvACAHURzNNy1QvY61C5K/pHQWWQGhRWOysZYZVg6NLDPC
	ImDfZqpNkShfK5C2LJwoBFjaPMUFwsA49d+ZjTvhykKzlzILC467fpULdOU5a2
X-Received: by 2002:a05:600c:8594:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48e676a4e1fmr185836335e9.15.1778531697513;
        Mon, 11 May 2026 13:34:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e62944bsm3582235e9.8.2026.05.11.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:34:56 -0700 (PDT)
Date: Mon, 11 May 2026 21:34:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Manuel Ebner
 <manuelebner@mailbox.org>, andy.shevchenko@gmail.com, apw@canonical.com,
 corbet@lwn.net, dwaipayanray1@gmail.com, joe@perches.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Message-ID: <20260511213454.22f00bff@pumpkin>
In-Reply-To: <202605111206.ECA86141@keescook>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
	<20260510165159.57457-2-manuelebner@mailbox.org>
	<CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
	<20260511142649.463c3ea5@pumpkin>
	<202605111206.ECA86141@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 12:07:38 -0700
Kees Cook <kees@kernel.org> wrote:

> On Mon, May 11, 2026 at 02:26:49PM +0100, David Laight wrote:
> > On Mon, 11 May 2026 13:40:55 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >   
> > > Hi Manuel,
> > > 
> > > On Sun, 10 May 2026 at 18:52, Manuel Ebner <manuelebner@mailbox.org> wrote:  
> > > > add strlcat and alternatives    
> > > 
> > > Thanks for your patch!
> > >   
> > > > --- a/Documentation/process/deprecated.rst
> > > > +++ b/Documentation/process/deprecated.rst
> > > > @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
> > > >  though care must be given to any cases where the return value of strlcpy()
> > > >  is used, since strscpy() will return negative errno values when it truncates.
> > > >
> > > > +strlcat()
> > > > +---------
> > > > +strlcat() must re-scan the destination string from the beginning on each
> > > > +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> > > > +snprintf() and scnprintf()    
> > > 
> > > The last two not only require the caller to keep track of the offset
> > > in the buffer, but also using "%s" when storing passed strings.  
> > 
> > Which also means they are significantly slower.
> > Mind you, some code has:
> > 	strlcat(buf, "\n", SIZE);
> > 	return strlen(buf);
> > which carefully scans the string twice.
> > Since the '\0' isn't always needed (eg 'show' functions), this can be:
> > 	len = strlen(buf);
> > 	buf[len] ='\n';
> > 	return len + 1;
> > Of course, the code could often easily get the length by other means.  
> 
> I think I'd prefer to only recommend using seq_buf API. Or for sysfs,
> sysfs_emit() as seq_buf hasn't been extended there yet.

True for the docs, but rather more work when you are just trying to
get rid of strcpy() and strcat() calls.
It can be hard working out whether you can use sysfs_emit() or not.
(And I recently failed to find where the PAGE_SIZE buffer is
actually allocated; I'm sure it should just be 4k.)

-- David

> 
> -Kees
> 

