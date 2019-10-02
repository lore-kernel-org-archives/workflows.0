Return-Path: <SRS0=2Hi9=X3=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B31BC352AA
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 14:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E34A2215EA
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 14:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="exP6oVNe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfJBOWR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 2 Oct 2019 10:22:17 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33722 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBOWR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 2 Oct 2019 10:22:17 -0400
Received: by mail-pl1-f196.google.com with SMTP id d22so7118249pls.0
        for <workflows@vger.kernel.org>; Wed, 02 Oct 2019 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=taXQeH6O5cW03JdrSSBVqAdzCKJD+N4bjRe92t/PYAg=;
        b=exP6oVNeC/b93UxCRlbusGW6/qg9ORMzudzs4YD8k05/YlvYVHTAYy4e2AYEANxjrr
         60SlmpCjUMeC0LT2/lnXAfpjmrTcUJYDe4gKBqVbU9gFzy/+Cmv+R0mQTompK4L/dCDc
         2uUDXOHc22GTir1bxAlDRtVREbzOWV+P3YtAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=taXQeH6O5cW03JdrSSBVqAdzCKJD+N4bjRe92t/PYAg=;
        b=dUw3LPB0BxvZ74P/mMQusXekdLtFfx7NxN+cvPuTjTFAauqDfwkDn/WNdfLkuPBqDf
         TAHgcpmwtckLFTnbKkTLH8tnfBLzAF+89NlJEduFwt1LiiYin+UVeuyKVlak6WzJCeE9
         trulgCN1GhsSt2Xzph6tLyeTlDaJCIl2Zl2UH2XbeJBc6+mcJW31kdlq4kvZ7MXA5UAs
         H0Qd3CBFNv9tYQmbic60eST3bvs2t4/GeyYKAL+K6LDqD11dAwGccn6a3J+1w3+A0zmZ
         rDXShxXwirvWaAiKFcHaqj2mT69XGXDQ+e9/NbzOFvz9Cj2R4BvpTpf9NHcLAf8IVdRM
         WOBg==
X-Gm-Message-State: APjAAAVpqaDe+tAmCnU/5izURS74WynMQ4/y2wsG1heRlHD8R6J0dmj/
        ncUlc+UCqFotZx2zdsXszKMP9g==
X-Google-Smtp-Source: APXvYqxZThxyuF8qg6Ff+2rJFw4VXqzgkRNOcUfRjyLnw5cPjAbbjhbkCDmWVrF2+y4syGe9RQ3KsQ==
X-Received: by 2002:a17:902:6946:: with SMTP id k6mr3957734plt.26.1570026135135;
        Wed, 02 Oct 2019 07:22:15 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id d10sm19463029pfh.8.2019.10.02.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:22:14 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
In-Reply-To: <2432650.iS68q0zTR2@kreacher>
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu> <2432650.iS68q0zTR2@kreacher>
Date:   Thu, 03 Oct 2019 00:22:11 +1000
Message-ID: <87pnjf2pnw.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

"Rafael J. Wysocki" <rjw@rjwysocki.net> writes:

> On Monday, September 23, 2019 6:20:01 PM CEST Theodore Y. Ts'o wrote:
>> One of the things I'd like to add as a strong desire is the ability to
>> review patches via web if that's what users would like to do.  There
>> are some real benefits for web-based review.  It means that if you
>> need to see greater context, it's relatively easy to do this.  It also
>> is convenient to be able to see the conversation for a particular hunk
>> of code right alongside the code.
>
> I totally agree.
>
> That may not be clear from my original posting (sorry about that), but it
> was my basic assumption that the web-based functionality would be there.
>
>> It's clear that whatever we do, it needs to be compatible with e-mail.
>> That's very clear.  But it would be useful if we can support both the
>> e-mail and web-based review.
>
> Right.

A long time ago now (before I was involved) there was talk of extending
patchwork to allow logged in users to comment on a patch in the web UI
and have patchwork send the comment as an email on your behalf. This was
in the happier(?) days before we had SPF and DMARC, so I don't know how
feasible it would be today. (Maybe the emails would just have to come
from 'Patchwork on behalf of J. R. Developer'.) But could web-based
review be as simple as a web form that sends an email?

(I'm not advocating that this be put in patchwork straight away or
necessarily at all, but I think a proof of concept that lives off to the
side of patchwork could be an excellent use of the patchwork API!)

Regards,
Daniel

>> There have some prototypes that have
>> been floated which shows that it is at least possible; perhaps
>> imperfectly, but something which provides a bidrectional gateway
>> between those who perfer to use e-mail and those that prefer to use a
>> web-based UI would be able to do it.
>> 
>> There will be many potential kernel contributors who will be used to
>> web-based UI's such as those that are available on github.  So while
>> remaining e-mail compatible, having some way of allow as many
>> operations to be done via web interfaces might help us get some newer
>> developers who are more comfortable to living on the web than some of
>> us more senior developers who remember when "gopher" was a text-based
>> search engine, and not a mascot for the Go programming langauge.  :-)
>
> I agree.
>
> Cheers,
> Rafael
