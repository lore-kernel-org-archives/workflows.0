Return-Path: <SRS0=W/h6=X2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF22C388F3
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 03:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2098B20815
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 03:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="fFLPzfgo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfJAD6p (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 23:58:45 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39841 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbfJAD6p (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 23:58:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id v4so6951850pff.6
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 20:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=akg6b685IGsieFNDUb4MAb44/1ayQrh3jWaYqq1k8j4=;
        b=fFLPzfgoyyPx6AntvMuJ8o846aBpu67v5WYwyP++WbSqMD6SbgaNGWAASZGlW5QAnm
         dnJCXIw5i4EUD8gyk9Ny/hbJRWcHmr4YGbMWRKhiJM+hgWzBj+gbTAR/aftZqcgnnhnb
         jdviBMg/Yf/eEVllye0A7x00efQCj/iWAvRPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=akg6b685IGsieFNDUb4MAb44/1ayQrh3jWaYqq1k8j4=;
        b=BxFU+Okl4wFWh2Q0iiyJIlo/uT9wAECbY3ieALI82e8OmNlUHSK98eKCEnxkQ6DujJ
         UC4X3vEJVC6umu/HQpWwSJyjrQG485nbEfPHGlGm9EHWmSM10S3bI7rQfaYehs278YWH
         mqGOAZrXV2y6LSRD0H5f1t2q7hTCWFrR/W8DCfj5ooGDsUiYeYY7UNLmbY9PLfuo+qR6
         lnkpkTs//03m47rVFu8pP0lRDW2kBIbH4tNH0DqleW7Mf1LxoyVBULAvAe7lxJ0bzaUL
         yJsqQNKrLQj7ym8RZQU+JW/lC5v4fblsbGu/UckEatOox+YbY4AMfwbSml6LBQfEQxtu
         3V7Q==
X-Gm-Message-State: APjAAAV1T0tFpaM564QJTPevFsqqyO6fAxJldQ0wqJqfcjCs0U6yxhO6
        VNIuznKpAxJVjspCIYyFVu+Elg==
X-Google-Smtp-Source: APXvYqzN5BMwPi/s51HBnc90gGR27lcbFbj2rKt2F+2croDjVsfqxqjMt8Dy9Lp7dNT5v9R8iWU6Hg==
X-Received: by 2002:a17:90a:3b01:: with SMTP id d1mr2992338pjc.81.1569902323274;
        Mon, 30 Sep 2019 20:58:43 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id 74sm15653433pfy.78.2019.09.30.20.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 20:58:42 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Eric Wong <e@80x24.org>, "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
In-Reply-To: <20190924013920.GA22698@dcvr>
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu> <20190924013920.GA22698@dcvr>
Date:   Tue, 01 Oct 2019 13:58:35 +1000
Message-ID: <878sq53yms.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Eric Wong <e@80x24.org> writes:

> "Theodore Y. Ts'o" <tytso@mit.edu> wrote:
>> One of the things I'd like to add as a strong desire is the ability to
>> review patches via web if that's what users would like to do.  There
>> are some real benefits for web-based review.  It means that if you
>> need to see greater context, it's relatively easy to do this.  It also
>> is convenient to be able to see the conversation for a particular hunk
>> of code right alongside the code.
>
> I've already started on that with public-inbox; it's not enabled
> on lore, yet(*); but public-inbox.org/git can use "git apply"
> and dfpre:/dfpost: search prefixes to reconstruct git blobs out
> of emailed patches.
>
> For example, a self-rejected patch I posted in 2016:
>
>   https://public-inbox.org/git/20160711210243.GA1604@whir/
>
> If you follow the link at the hunk header offset "+3,7",
> it'll bring you to:
>
>   https://public-inbox.org/git/8d27707/s/?b=http-walker.c#n4
>
>   The bottom of that page has a a "debug log:" which tells
>   how the blob is reconstructed using the email and pre-existing
>   blob.
>
> Since it can recreate blobs using patches, the next step is to
> support showing "git diff" against reconstructed blobs with for
> arbitrary contexts; but I got side-tracked from that earlier
> this year...
>
> (*) lore could configure coderepo associations, but that's a
>     bear with the amount of repos kernel.org has...
>
>> It's clear that whatever we do, it needs to be compatible with e-mail.
>> That's very clear.  But it would be useful if we can support both the
>> e-mail and web-based review.  There have some prototypes that have
>> been floated which shows that it is at least possible; perhaps
>> imperfectly, but something which provides a bidrectional gateway
>> between those who perfer to use e-mail and those that prefer to use a
>> web-based UI would be able to do it.
>
> A hacker-oriented a webmail UI could be derived from
> public-inbox and completely interoperable with other mail
> servers (it would also support SMTP/IMAP, of course).
>
>> There will be many potential kernel contributors who will be used to
>> web-based UI's such as those that are available on github.  So while
>> remaining e-mail compatible, having some way of allow as many
>> operations to be done via web interfaces might help us get some newer
>> developers who are more comfortable to living on the web than some of
>> us more senior developers who remember when "gopher" was a text-based
>> search engine, and not a mascot for the Go programming langauge.  :-)
>
> Unfortunate, but yeah.  Any web-based UIs ought to include some
> subtle (or maybe not-so-subtle) hints/pointers towards
> cheaper-to-run-and-likely-more-powerful tools and practices.
>
> I can't prove it, but it seems like public-inbox has been
> successful at promoting the use of Message-IDs in URLs and
> git-send-email :)

FYI, the next release of Patchwork will move to message-id based URLs
rather than numeric IDs. (Old URLs will still work of course! They will
redirect to new URLs.)

Regards,
Daniel
