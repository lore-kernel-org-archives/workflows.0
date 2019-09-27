Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2893C4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 07:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FA8E217F4
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569568112;
	bh=6r0PgJgGGPun4a/HlDiHnh/Lfh9w8ieLAuSPiq/sG1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dbSBRJ2uHHW40y9EwM8JSZYjunl+RQAe9VYOegeeVICcG8QH8GkHcs707Qh4+YHhZ
	 CPpMCcfrQ3u30B9WECWAApYTpNQJ/qTwu+ir4I4IEOTrbwxGZp+AQnNo90cDAjC5E4
	 GDqYzcH8Z0aKaRfq6PaVLH8EkOttNMkD1CTF2+jc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbfI0HIc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 03:08:32 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:33021 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfI0HIb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 27 Sep 2019 03:08:31 -0400
Received: by mail-wr1-f54.google.com with SMTP id b9so1450822wrs.0
        for <workflows@vger.kernel.org>; Fri, 27 Sep 2019 00:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L19txjiLjr5FuINLGJS4Kwj6HNEJKjCCoi7KXkGOi+Y=;
        b=Jq5Lk40fWSMLqXxQnXerQjJ+QhGHeAxImgkhhMj6d1fIYswNuCpHwfO4q4USiRLPAG
         /MMRZiHu2U8LeOhss8GvWiWgwBFtQajkzL0kyginw73A3o3XFUfbq9WJZ8BXUDUtZotL
         UDu6/zsgi9tbG99jKHOmXQu0p1dn/aIbmNn21NHfyowIukEIYeSzZ4/uXTRbNjy+RtX0
         ActJFXp0ybArSLwssIm+9++9yUcCjRoSxA0ncFYqnRQGj4Fk+OhH0cPeEY0Ye0hA90XT
         bEHwO3gxLgl4B4AOZYAA63tQjOTYUb1pfntrzqaJsxp746K80fddYycLy/qoi++3tNh1
         8zmQ==
X-Gm-Message-State: APjAAAVoWm2UfIDxCmLlyIQnmPWoYxqyHACiKSdaEM87hflE9bFtQ3dk
        MyvUmRX16rhM3RiYK7nXI7iId6uv
X-Google-Smtp-Source: APXvYqyIn2u2aG0QpyWEjAUWxMx11hJc61dIYb8JFrE2bYUQVM4UciTD1ioXYHrvp07IVN4U6HAOYg==
X-Received: by 2002:adf:f2cd:: with SMTP id d13mr1788918wrp.143.1569568109517;
        Fri, 27 Sep 2019 00:08:29 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id i73sm9578173wmg.33.2019.09.27.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 00:08:27 -0700 (PDT)
Date:   Fri, 27 Sep 2019 09:08:25 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: script to check "Fixes:" tags
Message-ID: <20190927070825.GA18955@pi3>
References: <20190926195143.GA1742392@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190926195143.GA1742392@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Sep 26, 2019 at 09:51:43PM +0200, Greg KH wrote:
> Since this list was created to share scripts, here's one that I
> currently use to test that the "Fixes:" tags are correct on a commit.  I
> run it on all patches that I accept into my trees, after getting emails
> from Stephen one too many times :)
> 
> It's almost entirely based on Stephen's original script, but has been
> changed a bit in formatting and usage to be a stand-alone script that
> anyone can use.
> 
> To use:
> 	verify_fixes.sh GIT_RANGE
> 
> if all is good, script will print nothing out and exit with success.  If
> there is a problem it will be printed out and the script will exit with
> an error that you can check from any other program.
> 
> It it 'shellcheck' clean, but I'm sure that there are other things wrong
> with it, so feel free to point out problems.
> 
> And should stuff like this be in the kernel tree itself?

+1

Also a kernel.org repo for maintainer scripts would be useful. Extending
own scripts for generic usage it's a lot of boring and not needed (for
the owner) task. But if someone else does the job...

Best regards,
Krzysztof

