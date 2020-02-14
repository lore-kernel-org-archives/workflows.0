Return-Path: <SRS0=XKJj=4C=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBE3C35242
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 20:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E796222C4
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 20:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fUWhpqMK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgBNUfK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Feb 2020 15:35:10 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35084 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730112AbgBNUfK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 14 Feb 2020 15:35:10 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so12127393wmb.0
        for <workflows@vger.kernel.org>; Fri, 14 Feb 2020 12:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=PzHjbCLRLifISh3lHzunB0TjQkdcqnNs7Mm4Me7Cmmk=;
        b=fUWhpqMKnBCt3qy1yxdENShYmKPvYGtjH++mOoYPthVa76suE0N3+c7V9WWRET0zxH
         pPYNVwKxB9GlrebTvpH3HRS40tsNY6JrBypbb1aEorT3V8KHmflYQ5BR+tL/SnUxK1Sr
         JCpKRx2iQ+Iii48spo8RU5FGYLSLs1aKO8MWa8tqEKN5UlGm88qbJ/sCVarwzyhkCJ3x
         cKVPzJu1bsMLUcY2uz+n6W3v2/w6OE7avQFiXFIkiOOz5bS47dGhlQmH4oc5ZFy/WO8c
         dwAS8SbbCXooOkkcUUbrQFDQzUJr7odyptf9YXP5vdUfVM8NIH12FUzN81BhI5ODf3Gc
         LJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=PzHjbCLRLifISh3lHzunB0TjQkdcqnNs7Mm4Me7Cmmk=;
        b=R7XnIIBmJBAjhkrYymHyBmcJld0dADchD+qsgIr4uei2YTIPxZaPMGJfrgYqZs6brn
         ic272l48lm8pAtqpYY12wne8pbrOsw7ZbxjEEqqk8CrahukKkXBNH70Ft7zEQf8hd7oC
         6ofiZwrQGJHWX7Lo9VCLwDqhqeBSKangGMpimn4grxtrQi+sHo2YVChkR9xkKmLty7OQ
         7Lhkf0WAbkDNjMWTf8vkbNJNGcpcn6PrSTb2gOM1h9VUzNZD6yAlsImfM8tD2AHJqNzx
         xLkFC6cfEJL3qrRcxeQeD1Rd6IHy86EygXw/CIFfB2JT86G1YiH8i2E1dhJtYJkqq5l/
         i2pw==
X-Gm-Message-State: APjAAAWktVSMWDozYpGQnNA5OGFSEOGkUvCCfSfENK6d6/5KJWiy8iTF
        3PXRprpA5FbSq7wrz0ldi8Rt2f/e3hI=
X-Google-Smtp-Source: APXvYqwIGUm4FV95xUFtY+peKtrDom8OP98mHRCGZ7ZgCdN+z2KoCuSNfTpyIHB4d1t+J5zCDu+GPA==
X-Received: by 2002:a1c:a752:: with SMTP id q79mr6080534wme.64.1581712508559;
        Fri, 14 Feb 2020 12:35:08 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id g17sm8790685wru.13.2020.02.14.12.35.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:35:07 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
In-Reply-To: <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local> <7hwo8p9db1.fsf@baylibre.com> <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
Date:   Fri, 14 Feb 2020 12:35:05 -0800
Message-ID: <7hftfcaow6.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Fri, Feb 14, 2020 at 11:30:42AM -0800, Kevin Hilman wrote:
>> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
>> 
>> > I'd like your opinion on this quick helper script I wrote that uses any 
>> > message-id to grab a full thread from lore.kernel.org and save it as a 
>> > mbox file.
>> 
>> This is very useful, thank you!
>> 
>> One question/request: Is there a way for it to only grab a subset of a
>> series?  e.g. Some series contain patches that might end up going
>> through a couple different trees (e.g. DT patches typically take a
>> separate path than drivers) so as a maintainer for one of the
>> subsystems, I might want to only get a subset of the series into an
>> mbox, not the whole thing.
>> 
>> IOW, Right now even if I pass a msgid from the middle of the series, it
>> finds the whole series (which is cool!), but what if I want to apply
>> just that single patch?  Or even better, I might want to only apply
>> patches 3-5 and 9 from a 10-patch series.
>> 
>> Is this something do-able?
>
> I think for such cases it's easy enough to just edit the .mbx file to 
> remove the patches you're not interested in.

Yes, that was my first "solution", but it's not very easy to
automate. :)

If there needs to be a manual step, I prefer 'git am --interactive'.

Anyways, this tool is really great and it's already replacing some of my
homebrew scripts.

Thanks,

Kevin


