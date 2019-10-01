Return-Path: <SRS0=W/h6=X2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94872C352A9
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 03:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6875020815
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 03:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="FGjdvozp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfJADwb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 23:52:31 -0400
Received: from mail-pg1-f175.google.com ([209.85.215.175]:47086 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfJADwb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 23:52:31 -0400
Received: by mail-pg1-f175.google.com with SMTP id a3so8635873pgm.13
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Rmo9CZCedDOl9CzaNdwcsw7P4SFNApjpEkIRZAjRXbQ=;
        b=FGjdvozpPv3hPLYYsbafXBSNPPfH5srzgItwOLXlFVKzTz48P97Pz7p6rbUoQXthht
         QkeBQs69fq1tNdudVBYg3AXH9oEfwkQjU8yIqDRXgo+3uhoArZFzzzOfJpdlPscqUilH
         M4v3oq6K6N/nAGz8AF/htshdlUyHU9oN/R3+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Rmo9CZCedDOl9CzaNdwcsw7P4SFNApjpEkIRZAjRXbQ=;
        b=YS9tjdHNjlQKKLUlAQsIUtAuSW7SQypFh2Fe5fzsEF3c/Dm3A9BJtGAGW/vQppTQdW
         sb7vwYEB9djSGpU87KWXFyyWjz8eP4XyjYCTr2inXdlqoSqHkxsMn3uDp4lH493tpgl5
         D84JGs9330sjd5obtcLGObwBibF+iO1/+QyAYXY116blk+8lwbOwOTmkwdSqCu5kmP7Z
         GChDJY9njUIDdPd5eQmTs23dX77wrNId6AIC+VDlLWFLCC8tSJRsqbNpT//LyZsLX8l2
         ZQ6mBKqprsKt3httgUp0H/EzQtZJlJrGT4yh3R0tQbgcCY67nYjbyRF0DWDtA63p57Vd
         Z5nQ==
X-Gm-Message-State: APjAAAW18B7IutAKaOuWjCNjwW15aD4W2KA28JqjXsmmAb3LBva2Fa9y
        d0aB5C+PLCFL/jUO6inacW84gFxokF0=
X-Google-Smtp-Source: APXvYqxf/H9vVqCav1CWHZh6JdzdnpcW7EChgUUu+3ez6VgKvwpn6ZLkzA2cg2NzTJJUF2k9llCohQ==
X-Received: by 2002:a17:90a:cb16:: with SMTP id z22mr3185971pjt.70.1569901950166;
        Mon, 30 Sep 2019 20:52:30 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id f3sm16108647pgj.62.2019.09.30.20.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 20:52:29 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
In-Reply-To: <5072394.GngetUhsyG@kreacher>
References: <1811089.yxvLMk49Ug@kreacher> <5072394.GngetUhsyG@kreacher>
Date:   Tue, 01 Oct 2019 13:52:15 +1000
Message-ID: <87blv13yxc.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

"Rafael J. Wysocki" <rjw@rjwysocki.net> writes:

> On Friday, September 13, 2019 10:22:20 AM CEST Rafael J. Wysocki wrote:
>> Hi All,
>> 
>> During the Maintainers Summit session yesterday I started to create a wish list
>> for the new kernel development collaboration platform to be created (and to
>> replace the multiple pieces of tooling in use today).  I also asked Bjorn,
>> Jiri, Greg and Shuah for input and here's the reslut:
>> 
>> 1. Compatible with e-mail
>> 
>>   (a) E-mail send to it stored and included automatically; appears as part of
>>       the normal flow.
>> 
>>   (b) Automatic e-mail responses
>>       If e-mail is sent to it, the sender will get all responses to it in the
>>       given thread by e-mail.
>> 
>> 2. History tracking
>> 
>>   (a) Should be able to track revisions of a given patch series (or patch) down
>>       to the initial submission.
>> 
>> 3. Integration with git
>> 
>>   (a) Should be able to create git commits from patches (or patch series)
>>       tracked by it if pointed to a git branch (either locally or remotely).
>> 
>>   (b) Link tags pointing back to it should be added automatically to git
>>       commits created from patches tracked by it.
>> 
>> 4. Distributed
>> 
>>   (a) Support for running offline.
>> 
>>   (b) Support for batch updates.
>> 
>>   (c) CL-frendly.
>> 
>> 5. Patchwork-like features
>> 
>>   (a) Delegation support.
>> 
>>   (b) Support for bundles and patch series manipulation.
>> 
>>   (c) Smart mbox (download all selected patches).
>
> And one more item from myself:
>
> (d) Support for "maintainer views"
>
>     That is, by default subsystem maintainers should see patches, bug reports
>     etc against the code maintained by them, with the possibility to extend the
>     view to also see the other submissions.
>
>     [That kind of is the case in Patchwork today when patches sent to different
>      mailing lists show up under different "projects", but the problem in there
>      is that copies of one patch appear under multiple "projects" as different
>      entities if sent to multiple lists.]

/me puts on pw maintainer hat

This is true, they are each individual database entries. This is largely
because projects will often change the state of patches differently. (An
example is a patch sent to multiple lists to collect ACKs before being
merged.)

Unsurprisingly, there's not really a lot of funding for pw development
at the moment, I'm doing it mostly as a hobby - but once we smash out a
bit of technical debt I'm slogging through it should be easier to
contribute. We also have a pretty full-featured API that I would
encourage people to check out (e.g. https://patchwork.kernel.org/api/) -
we already have a few lists using this for CI with projects like
snowpatch or custom GitLab scripts - just check out the linuxppc
patchwork for an example.

Kind regards,
Daniel

>
>> 
>> 6. Easy to set up (especially for local installations)
>> 
>> 7. Bug tracking support
>> 
>> I guess there are more items to be added to this list, so please extend it if
>> you have any ideas and we'll see where this goes. :-)
