Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079E3019CD
	for <workflows@vger.kernel.org>; Sat, 10 Oct 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628395; cv=none; b=bwmlA3h3QlMDQ9RKQs+tpQ0zgGGUwhk96xIirthZpDZYwLVQ9TygQfJn4zecxlXcEQN0d7LfaWSWpBSjdCTTxa8hl0oHw8XSVhS/Vs24lGpaZiGTTJbRrJfOK57bps5MnxLNe2h5wZJu2muNZeCK8nw2xlpwkB1ZZ7nMBCGI2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628395; c=relaxed/simple;
	bh=cXpXyyAxJEQk85gzl9TTiU5pF79hr7iF/5HP6KNcpRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSsIlGThT9uod8sSySjv4DH7gDPKsgKBf5XCcka9B++/bx6qE6PwpO+wAnrNH4NAP5R9t7xBNyE+wy2bVxjOuFLWGMWZFPf79+oVgi2fYCGI8Z7UKT86KyPUE6RIDrhRBm0pyR6IQP31Mv3lTERG/2ubWn3443wqqLgQFe+qeZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgnV/I92; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fAZUhG3h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgnV/I92";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAZUhG3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791628393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
	b=HgnV/I92kXG01DTKMkUrP2dX39BoAXibQbyQoob/tNrAJcuHgbkLCmfYQS9k8Ywes+MwZq
	RisB6mUykI8mh7V1hiKDPeBQRILWpR5F74PFyG1HFTe+BEkFlkN9roAEef4i1Kn40TxQt8
	AHjuOhXsDHZqjbcpN7vDEVuZQmWiySU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-6ACQThT6OuyLeXnwLQY-sg-1; Sat, 10 Oct 2026 10:33:12 +0000
X-MC-Unique: 6ACQThT6OuyLeXnwLQY-sg-1
X-Mimecast-MFC-AGG-ID: 6ACQThT6OuyLeXnwLQY-sg_1791628391
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so6469615e9.1
        for <workflows@vger.kernel.org>; Sat, 10 Oct 2026 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791628391; x=1792233191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
        b=fAZUhG3hSkMR+eSLrG/1BQVa5B8HUZi8jnALPAYtTjgesfR2k9vpNfoWHBADgvxc6Z
         xn4C9v8xtMtHlkYr8AWBiDAb8ejXhGXYjKXYPPMAVzAZpbgwbFrT85S8ZMpsUlYbI9Tp
         CG1Wlcb0dSVTk1GKkSh2JkvOnLM+b6XA8zoWEO3Uz48zlyJT9hXt+mf86DvwrFiPBrbo
         OiA4mkYhIg2dtYMZgj2Dc6eszm0dGMLjv0yca5yzDxpJJm69jd5fFKe5Y49u46x6t/EQ
         gjsgxEhEBJOyzQ1TA95CA1oLhYPNk29nRbY4dFWrGeC3AD1xaJ1S3BkTC1rrTARfVlWc
         aCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791628391; x=1792233191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
        b=qMBwexjFOjPdH5H6okg9jP2FHdXggag3XHtNf0Yp3ieDUjGVTFFSosJ2jo3qsqy+qN
         j3XQTNIMOSSUY9XJc0yNo/i+Ix8dJAWP/zwON6yXRTWh/cku0kg9dyv2zmZpsq1E3xun
         h73rLFORamM2Mc5JXE5qJIVi+YVD1qrCR5Cqu5LaUuaOEzwoDXt/Fmf3uIha6uMiGbMk
         hSxC5Xt7XDUilw+ySFRSW3PgdZl98ZSgXIg8zZnSrBAq/fUahY+OK1e1P8zIQGLQHrkf
         jDM1KvbCNP4dh+bpX8oJExS4QpiPNM3/eRkGSZXizUZ7cv+2Wxyis7A2hj2QqCTpNCec
         DtJQ==
X-Forwarded-Encrypted: i=1; AKwUvByqbTQOtL7nwfDBAOcRqaCP5rSiRlfi2PfjSc/r317d6uu3nxKAfxA4ISGu+JPWBZ/bB61GfdN7Yj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD6w7wUFpSjIXx2PaORvifdb7nEOvgXOkb7JdRH38Fpf8SBcqL
	1u9VBd/ZwtsATzBE1bdaNOO72GqUyUv5+KroTrEeHoBiwBAtVMm034ONTDKqGlosTzSBJ6XFf/e
	MGpGSTAsDWpkJr9N8R413PKiJ/e+cREZv4ZmmippA7Ym1labC10bHA9i+/gdtUA==
X-Gm-Gg: AYBFou0IobETvuY8F8hZEXTs/5xnnQ6RlAyiFkq34NZPU5lfWp2Ni2xPiI7uzVS/dF0
	pn1tan5/ImYRepIRINFqUJJCGHNzfACdYyRPzoCEk/zO4l/ASW1JfgpsyNi4cPpTkqauvIXpj6Y
	2MWHabCvw0CG24X1zmP23sZ690WOfXLKOQIBIDyhzPeDAO13PggCCbLEcnDZ40G8V4zpVkxfS0O
	yfoYptJQ8TqemzlthMdc3baAyeVFZvm71zaUs9eHXn6R6jD4B99mClxJfjo4feKD+vRFFo7M2Ki
	DtDIS697SLkbDCL7EQOxwsDqKf1Sb9fwKq/tNl4pqAWeBrGaRS9Rxoz6MwkVgHndP7J3rYE=
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94488365e9.21.1791628390733;
        Sat, 10 Oct 2026 03:33:10 -0700 (PDT)
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94487985e9.21.1791628390226;
        Sat, 10 Oct 2026 03:33:10 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c3a13sm8328544f8f.25.2026.10.10.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:33:08 -0700 (PDT)
Date: Sat, 10 Oct 2026 06:33:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH 2/2] agents: add a skill to determine Fixes tags
Message-ID: <20261010063228-mutt-send-email-mst@kernel.org>
References: <cover.1791499378.git.sashal@kernel.org>
 <7fa126fd22b4449cf63a7045f7cd959e106fac87.1791499378.git.sashal@kernel.org>
 <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>

On Sat, Oct 10, 2026 at 11:40:56AM +0200, Thorsten Leemhuis wrote:
> On 10/9/26 00:54, Sasha Levin wrote:
> >
> > +A ``Fixes:`` tag identifies the commit that introduced the bug being fixed. [...]
> 
> Sorry for partly hijacking this, but it seems appropriate while we are
> at it:
> 
> What exactly is the right commit to specify when it comes to a
> regression caused by a change that exposed a way older bug? The change
> that exposed it? The change that introduced it in the first place? Both?
> I'd tend to "both", but I guess some people might consider this as too
> noisy.
> 
> I've seen occasional discussions about this and our docs for humans are
> a bit vague here:
> 
> Documentation/process/submitting-patches.rst says:
> ""If your patch fixes a bug in a specific commit, e.g. you found an
> issue using git bisect, please use the ‘Fixes:’ tag with at least the
> first 12 characters of the SHA-1 ID, and the one line summary.
> [...]
> A Fixes: tag indicates that the patch fixes a bug in a previous commit.
> It is used to make it easy to determine where an issue originated""
> 
> And Documentation/process/5.Posting.rst says:
> ""One tag is used to refer to earlier commits which introduced problems
> fixed by the patch:""
> 
> Ciao, Thorsten

I'd say the one exposed it. this way it is useful to answer
the question "do i need this fix".

