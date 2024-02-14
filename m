Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF7F60DED
	for <workflows@vger.kernel.org>; Wed, 14 Feb 2024 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707937353; cv=none; b=As1R4pLGill2Z6SMuRFR2AN09Q4IlrTnU7Gsu+YdbGWwhKAk9lLovNCX+ewhAPe81MJh4D5P8g823w+bLmoHqZD6dGdYPrWlnB2WnqpX9/dvFcq3Lx6pQRWRNjf8VEKbuY6gL50Gys7UTcP1LHCEUwqjepyUfqXSkYTSgFHkCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707937353; c=relaxed/simple;
	bh=o9V86J778Qw9ORHGoxTvHvPPvhDNWXNy1lzpNIZSXQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9FARKd7ltdnwz4OHK9YU/BUcQ2inmj3P3e4QNAORjm/XurSyOTKhiLg9V6cK5EldzLCxoRX4OVC8KgIihqK+r0aZtFrSeE+0e0CATDAH9+1TQMfkxl4sLkhR/Wr1imchJGVnHd3YdvIUMW8KFqkvw4l441d522tnTUK/04eDBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mKIbtAeI; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mKIbtAeI"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so77269a12.3
        for <workflows@vger.kernel.org>; Wed, 14 Feb 2024 11:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707937351; x=1708542151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8cj3WGjTIoXh6wD8DzhhqKr02v4fpM95PIYtpQFjUM=;
        b=mKIbtAeIRXKQpQPTJcOd0Cwatz+2CR26oTDu0Jy1DGlo0rvuMMsrbKuEKokaKV8z1+
         FuZnDczbw6/Xk4p3V7ZJaxf35YzHBv7nR/bqMM67fYvvmLaZH4oew93k5lfrM6FgwU79
         q5EHY6Pn3/it6BHcBP8ny4lHhsG2vpQ6a4MTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707937351; x=1708542151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8cj3WGjTIoXh6wD8DzhhqKr02v4fpM95PIYtpQFjUM=;
        b=iCpT35FoeOOTeGdhfZ+3G7gZgBj+0K/RKKHfRVP92S9nbPSos8l3UHvOCREMk4E6/0
         KM/aVwYZgsArACAZ8RH9oxiycHPtzvVdLdsEg3LG6xi/WBngmQrsU7n8yWCUjlUehpJY
         dWPVUv4zFPtXfWvyO6nY04CfG+IlZBrEBRxYisVdNaR0aZ9jA/54UsLQNpfJH69spakq
         jNYby0CtGzgxeuksV2j1i+8H291rE9ozQiRkP5/9CdPH0EO/9QP/55F3C1HJpV3qo7zm
         gUunIzYckt3IC7Unfm0dRcp7Ck1Tk77su5/vysLLEk30RXqJrxfD3lYOrgQiegL885Np
         vCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX85PYilMQLgtGFEExs3uMFZN3OpyCS2OjexqvAdD+3Z7e3pKJIuIdcP3dneSE8XWEXyT2m2yRfku8b52Ylzjk4xBdTdmcVM6Bd
X-Gm-Message-State: AOJu0YzJ19V92iW4D0ImI/YXighg9sPu5ZHCk7DfSvHqYKmwv0+WAwPK
	bG66ymN13t/Qq4nfvTfKWZiRIXxzRPxdwj6LUbM5n04r44z3iJX3nxCom0sMvQ==
X-Google-Smtp-Source: AGHT+IF+hjoQEH+X1/rP3sksppUqYAMM+QWmvhGnhuhaOBX2W7UuIRsSUKsDpq8q3c9YbeBArJgf5A==
X-Received: by 2002:a05:6a20:d04b:b0:19e:c32f:35fc with SMTP id hv11-20020a056a20d04b00b0019ec32f35fcmr4403096pzb.38.1707937351190;
        Wed, 14 Feb 2024 11:02:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLDtjer+VatrLAp4k0+5kTGkqfTm/bLoncdmjxPUHN9QxfBzG8dERw5/gY1u2yoGnAGa9YRjir8IpRAV6WadMuFbMMhQp/EZXQbUQU+IvsxN5VhEAJs8awdk1BWhhDNmwJ1TIN0xYBrJX3breBDkkxmOzlWXtfXC2R4ifcPag2PLRHIzDHE6phBEvehs0vpv8quOxT9EeR8wfl/VCPJj3secGFwZRltDvDwDipSS9+UlMYrlANW03r/Ao=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r15-20020a638f4f000000b005dc389409c1sm4568003pgn.93.2024.02.14.11.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:02:30 -0800 (PST)
Date: Wed, 14 Feb 2024 11:02:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, security@kernel.org,
	Sasha Levin <sashal@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] Documentation: Document the Linux Kernel CVE process
Message-ID: <202402141102.FA1428F1@keescook>
References: <2024021314-unwelcome-shrill-690e@gregkh>
 <202402131429.A604440C6@keescook>
 <2024021445-emporium-tightwad-3c35@gregkh>
 <2024021446-rosy-citation-0a80@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024021446-rosy-citation-0a80@gregkh>

On Wed, Feb 14, 2024 at 08:45:19AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 14, 2024 at 07:43:32AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Feb 13, 2024 at 02:35:24PM -0800, Kees Cook wrote:
> > > On Tue, Feb 13, 2024 at 07:48:12PM +0100, Greg Kroah-Hartman wrote:
> > > > +No CVEs will be assigned for unfixed security issues in the Linux
> > > > +kernel, assignment will only happen after a fix is available as it can
> > > > +be properly tracked that way by the git commit id of the original fix.
> > > 
> > > This seems at odds with the literal definition of what CVEs are:
> > > _vulnerability_ enumeration. This is used especially during the
> > > coordination of fixes; how is this meant to interact with embargoed
> > > vulnerability fixing?
> > 
> > Yes, this is totally wrong, it was the original first draft of the
> > document, that I did on my workstation, and then went on the road for 3+
> > weeks and I never sycned up when I got home with the updated version
> > that is on my laptop.  The updated version addresses this, as it was
> > rightly pointed out by the CVE group that this is not how a CNA is
> > supposed to only work.
> > 
> > Yet another reason why keeping changes private is a major pain, not only
> > for security ones!  :(
> > 
> > Let me send out the proper one after my morning coffee has kicked in and
> > I resolve the differences, and make the grammer fixes that Randy pointed
> > out...
> 
> To make it more obvious here, as others have pointed this out to me as
> well, here's the updated paragraph that will be in my v2 patch, with
> proper ';' usage:
> 
> 	No CVEs will be automatically assigned for unfixed security issues in
> 	the Linux kernel; assignment will only automatically happen after a fix
> 	is available and applied to a stable kernel tree, and it will be tracked
> 	that way by the git commit id of the original fix.  If anyone wishes to
> 	have a CVE assigned before an issue is resolved with a commit, please
> 	contact the kernel CVE assignment team at <cve@kernel.org> to get an
> 	identifier assigned from their batch of reserved identifiers.
> 
> Does that help explain the process better?

Yeah, that's great. It get qualified with the "automatic" bit, which
makes this clear now. Thanks!

-Kees

-- 
Kees Cook
