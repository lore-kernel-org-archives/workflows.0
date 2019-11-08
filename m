Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB951C5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 08:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CCD02178F
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 08:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f7G331WQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfKHIaz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 03:30:55 -0500
Received: from mail-vk1-f176.google.com ([209.85.221.176]:36026 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfKHIaz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 03:30:55 -0500
Received: by mail-vk1-f176.google.com with SMTP id d10so1290098vke.3
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k74K9qxBXEe03i9sWGZQuN7iZ0OGz9YDUUxBBc/5R2c=;
        b=f7G331WQngR0Vyfj786Y0KBUc6sLhXVdFamHMP3WtQQGWJa2JBOioaiBbedv57RduZ
         JPmQ2JMEE2s7x1QsDnxJ9ieV2ZFocJ4GNr8QfBAzkJMgq9p4ANwHdmPNiqT6rXfCT2RD
         KL7S4ATi0iTtjnovS7N5RwhSzyLWiMH9dF9GvuWlPARXUYh3xrW1R42+XQ9wtEXZJAwK
         IVYJ8NYF592moBsRsqnqntUgxbsG3V7alK9idFnJhtDuYOATEzk1uzFiv2ExZ4m2WTtZ
         JFxom4W6MStAdpKNOOronwPaojwR5rDdS3N49J5tMpqrHo11TKPm6L4XmQZai/ao3Y7B
         hIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k74K9qxBXEe03i9sWGZQuN7iZ0OGz9YDUUxBBc/5R2c=;
        b=jhR4mJIf6UhOELVudDBNE4quHbZk/wFJBR/EAXL9f4w6z45PRUhtjArb3713jKzjlO
         zuQhio5SqgdxCvrXHbDHrlCXbZRXZcDgZWpo7bCXn+NPUtWaqlOjrfpsOHVLlvNRWSka
         tTrJpUJucMGnBhm/kT6h4uqQPp5UXLKAMp65pjVCcuaxYRHLf+bFqWA/E0jV7HRy8ffa
         bEpwLgerkl6igVd3dPUvJWM35u4RPSGHoM6UCli0CY4r5gRHt34aZ7+ng2nzW0/bMaAg
         nKJ5qcMFUR6Lw807i+IJqsXTcBMbaouRxJttHzSOBZTE75iFcBaWPyyaLtLqLHnvrmXQ
         nJRw==
X-Gm-Message-State: APjAAAWtuvXs4f5eQpcnGofXNuqrHqkbhGrWFEK4pJ6V4urs8OyF4aYu
        vdURC697vSazTiFdiyE5c49KTxWIVbrcJOe2NM2uRjvzcxg=
X-Google-Smtp-Source: APXvYqwVKYXZoz/6v/7MxMQMml9wZyiNGq0E8T1knM96gdf3lKeICVOOpZUNfva1joBdJebiZ4iqQZw0Xxen3PCef+o=
X-Received: by 2002:a1f:2155:: with SMTP id h82mr6500800vkh.18.1573201853448;
 Fri, 08 Nov 2019 00:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local> <1779121.stEDml5jbt@kreacher>
In-Reply-To: <1779121.stEDml5jbt@kreacher>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Fri, 8 Nov 2019 09:30:41 +0100
Message-ID: <CAFQ2z_PCYbY_vBnbjVrVijMteG5iRYHSUswe3Vo8Jp-OFBxZAQ@mail.gmail.com>
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision flow
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 8, 2019 at 12:45 AM Rafael J. Wysocki <rjw@rjwysocki.net> wrote=
:
> > 2. Should supersedes: link to the previous version of the patch, or the
> >     first ever version of the patch? I am leaning towards the latter,
>
> And then how do you know that version 2 was superseded by version 3?

You throw the message ID into a search engine, and see what it returns.

The advantage of keeping the patch series ID stable is that you can
consider a patchseries as a document and then easily index it inside a
service (say, patchwork) using Lucene, ElasticSearch or some other
common technology.

If you make the "supersedes" refer to specific versions, a workflow
service will be more susceptible to errors if messages were lost, and
the service has to work harder to aggregate the different versions of
a patchseries together.

Is it common for different authors to superseed each other's patch
series? If yes, "superseeds: precise version" is more precise, if not,
you get the same information from the timestamp of the cover letter.

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
