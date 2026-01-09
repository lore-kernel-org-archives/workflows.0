Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF033BBB6
	for <workflows@vger.kernel.org>; Fri,  9 Jan 2026 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956455; cv=none; b=BE56dLF0hLOnSKl7vV+4V+QgBOvN+D1N+HzCVCq1ue9jbZ0JUC2lfZijFk+PXJ8bz2IZHlVZRe7e2+L5BHEl+8qQDphBA354Jm6vA3VU/Zad2cjekTjXmsB9XUMYbO//Zu9IO7Cpvj4RAp7FCdRY6evXII1j4Kf/RkNVP7rMUgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956455; c=relaxed/simple;
	bh=hZXJGPMssGAfFbu+bAlt6gHtJ32mOvpL6uEOa1ztUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3KT/10yeLFhT89YCVdVM2Tf1SQ5PbDbFrVmC8LPgtuABM4B2BItUkGYJjfzvaDN3j1dgj0ACm3vGLM9+xBhf97r8KriN05gyIgnGWV7fglshe5O1CGJrVxumtntF9Zn9MJpYloP/URGCL5H4PNm+NRMtNAG83pFak3P1FRvn84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEUKQ9Nr; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEUKQ9Nr"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-59b685d2b79so3982659e87.3
        for <workflows@vger.kernel.org>; Fri, 09 Jan 2026 03:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767956444; x=1768561244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCAkSgcFGLWAnWdp4SQJtJGZ2mOqXTVgkdEMSVyfWUo=;
        b=yEUKQ9NrYWg/8MqEsPvrtT3Kx/sfUg3lBKkSTHfmNte2HfSRdYx2GmahD9EuuzflJs
         AV6i3ia8bK0dDQc2vqbUPank3zQivCP+vw+UQGTq5LhAbehOIIJo8j7AQMrL0oNyi2es
         t4Zq6vUxDlMkDUNCNXblFcQU8YfHmcbcJGtY1E/n9HyKuaVAkWBe2x+JWjCC2PlcGsLB
         4d+2s0rbuZe/FmnE+a/Rf/ELkDiX24+4YMi5Ers9lCWtB6ZNX8Tjl+RSdjuhDcz4eAcW
         De7+iKvXGSvSps75XCFlVdoWCxh4vMuYGOTI93xCPpeZ6Nd0w+XWicmOfAmudo/hQME9
         +m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956444; x=1768561244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCAkSgcFGLWAnWdp4SQJtJGZ2mOqXTVgkdEMSVyfWUo=;
        b=sGM//E5hBmwcx3cqugWywAXs4WFmyKicyMAREfeHoey1uqyWFo4RdRbVC8R2M4ZniP
         UWcU6X3SGMEYFcesi5v8CSLDKE66nsSH/bpcOSUT+4ZaAkVAxqQw2Og54XvqNREIYmQi
         Qy+ow3Hb3WHw/yYU9qUvbVlDZUFwmXe991+LkFAaZWZ1eMMYOwnodXZE8N+y5uVa/5yZ
         lwuidNT/XD5lPlVLqRs2mrodoHW8d3fVpjLJvFf+yoBvjFiWI281li7+mMRSR0YzxK6a
         sFPPp3fvvYZzchaTiJRD2REec2Fkzzr4wkXsMTZaxvXAtp+61yh8Zz0Jpd00XaSSyROj
         sHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrphw+juiJwPj0uRj9EElAzr2UlrQzmzTBQ3J8no5v0svydFCRp1TGiLz6QsoRkYfX4cssbhlnVPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKza8dkYRdJ6NcQO/Hxm/fifhWsEDZd41QUmYYFcgwJJQHatl
	N56Uf++kFObpZ1LtRwCTO9/lSilfOPrA1odb1TJU/2sMtgWeNIpZiUEZit8ZWQhN4Gk=
X-Gm-Gg: AY/fxX5gBfofmWwrpG+DNlVp7mvCyddUiC0X1Hc/Zlpwf35ESFwuoUoHYORC49LNYF9
	2JU0KT7nolF00iypjAE81nyvtRy005pGUZu+DNYC/dfKJZ6+IoenzMNub5CnQT9t243Tuf6Kw1O
	VQr49fjudBQWX/gnpb1VOD+WDupLEzIwB+urQhCsF1fU0RYZlFhKgSwO5PfpE52sZ0rYOmr+HM4
	GbAI6tJpFAghmfHadoUe+iSEuxkIjJs5b93x4aeL6FqLuOQXo2mK0vlSxsCLNK8Y9cVNHzCrS5p
	i2T7ive/5T9FHqT9sYqRR32SWUcM12v2plA2nw3AxVNONmm4C6D47ivDEtQDNj3/l4ZTokAxLwj
	/hsprtQ3yff0kQg7eSY6cO0lYRGlot1Z6OCJaKcge9pR3GU+KpnfYmBvkkAbD+jZWOb/NcsAMkA
	02PdeM6fxUksBiOmZi
X-Google-Smtp-Source: AGHT+IGXxI7r72eOkIy1KhlxJm58/JxPLQ5FF6CoxfgXHR2DOpaiFz27HbBI+CxtT+yMU4/t1/5Biw==
X-Received: by 2002:ac2:4e04:0:b0:598:de38:9150 with SMTP id 2adb3069b0e04-59b6ebe3029mr3229097e87.0.1767956443522;
        Fri, 09 Jan 2026 03:00:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b728badebsm1800519e87.67.2026.01.09.03.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:00:43 -0800 (PST)
Date: Fri, 9 Jan 2026 14:00:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWDf1zlLTKmw9xnq@stanley.mountain>
References: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
 <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>

On Fri, Jan 09, 2026 at 07:48:35AM +0000, Lorenzo Stoakes wrote:
> +cc Jens as reference him
> 
> On Thu, Jan 08, 2026 at 03:14:37PM -0500, Steven Rostedt wrote:
> > On Thu, 8 Jan 2026 11:50:29 -0800
> > Dave Hansen <dave@sr71.net> wrote:
> >
> > > On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > > > I'm also not sure why we're losing the scrutiny part?
> > > >
> > > > Something like:
> > > >
> > > > +If tools permit you to generate series entirely automatically, expect
> > > > +additional scrutiny.
> > >
> > > The reason I resisted integrating this is it tries to draw too specific
> > > a line in the sand. Someone could rightfully read that and say they
> > > don't expect additional scrutiny because the entire series was not
> > > automatically generated.
> 
> I mean you are making an absolutely valid point, I'd say that'd be a rather
> silly conclusion to take, but we have to be wary of 'lawyering' the doc
> here.
> 
> > >
> > > What I want to say is: the more automation your tool provides, the more
> > > scrutiny you get. Maybe:
> > >
> > > 	Expect increasing amounts of maintainer scrutiny on
> > > 	contributions that were increasingly generated by tooling.
> >
> > Honestly that just sounds "grumpy" to me ;-)
> >
> > How about something like:
> >
> > 	All tooling is prone to make mistakes that differ from mistakes
> > 	generated by humans. A maintainer may push back harder on
> > 	submissions that were entirely or partially generated by tooling
> > 	and expect the submitter to demonstrate that even the generated
> > 	code was verified to be accurate.
> >
> > -- Steve
> 
> I don't really read that as grumpy, I understand wanting to be agreeable
> but sometimes it's appropriate to be emphatic, which is the entire purpose
> of this amendment.
> 
> Taking into account Jens's input too:
> 
> +If tools permit you to generate series automatically, expect
> +additional scrutiny in proportion to how much of it was generated.
> +
> +As with the output of any tooling, the result maybe incorrect or
> +inappropriate, so you are expected to understand and to be able to defend
> +everything you submit. If you are unable to do so, then don't submit the
> +resulting changes.
> +
> +If you do so anyway, maintainers are entitled to reject your series without
> +detailed review.

This is too subtle.  In real life if we suspect a patchset is AI Slop,
then we're going to reject the whole thing immediately.  No one is
going to review all fifteen patches one by one as if we're searching
through monkey poo for edible grains of corn.

The AI slop patches I've seen were not bad actors.  Someone saw a
TODO in the file and thought that AI could solve it.  The patch
compiled, it was formatted correctly and the commit message sounded
confident so they sent it.

To me the audience for this is maybe a team working on AI and they
don't have any kernel developers on staff so they assume they're being
helpful sending unreviewed patches.  The message should be that every
patch needs to be reviewed carefully before it is sent upstream.  I've
been asked to review patches like this in the past.  Get outside help
if you need to, but every patch needs to be reviewed.

regards,
dan carpenter
