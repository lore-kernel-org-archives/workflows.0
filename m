Return-Path: <SRS0=QiH3=3D=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A531C33C9E
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 19:06:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5429C24655
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 19:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM4yGMMv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgANTGG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 14:06:06 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:36441 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgANTGF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 14 Jan 2020 14:06:05 -0500
Received: by mail-il1-f173.google.com with SMTP id b15so12521249iln.3
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 11:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=n78b6fBtV4fRBX/RZW6L2JnJ3o+I08M5rDycuiu8020=;
        b=TM4yGMMv1WCmqNCM6mfdTKtcTfySnaqN93U99bEanw7daejVOE5YNEFkisCh3WR7N7
         r8PDj3Qpa56FfDSGAZNTTS3lA51tvEze2yvZhofFAzUaBn1+aYF6EzXD7wOkxNtY7h/d
         b1cqi9RSK4jZGpra6sP23S5EPVd8lnSMwc7B9QAlJIyU8B102GomnjHGB63V7OHRxvw0
         /I0aYIL5jnL+apniQsLVwPkMVHKR1Y3yuhYT4/dYdgsD8bkircRGMcclZpJAWyEcBzu1
         X1Zt7dquU2Qmoxj22fMhSN2Rt/aK815M9KpBabHFtpMPF7vwtcQygSGvX9GvTvyA32T+
         qIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=n78b6fBtV4fRBX/RZW6L2JnJ3o+I08M5rDycuiu8020=;
        b=cMSrHUsvnIGw8JIMX7Z+iky5sYg3gDBuTyAYXCIha+eHFymjNE9zti9o/UzrvCxms3
         mSDWhNUBmE2UMYrnrX9vVxB2KoKRRWTvnV++U+7njsI6T5VfRxBoJawgp2X7AV285ak/
         rF6BEjC/y1zK5gbAoRsD39Ja5J7gJYbo649zHaMnCtMt6HEXaGE//roq+NdD+P35N5Xe
         zWSEIU7EmTt1xRDjnuOSo8nWn3SlUEGxrkQin1T3o/mpM/710MvADgpbTZ9xyiu0U3UX
         6fpgVmZultJ9gY321uelP7fKNQsDCqivMUnzliogoHww9a8UKEnl1b0m//2tBdiH6l8t
         0W2Q==
X-Gm-Message-State: APjAAAUuZ395uvv6SeVGDw5Hn8xCazOEu2DljUdXDOYgU3kLfTVz0Sn9
        fcaBKPKr2yUl+lyVJGfYmtNdBu1MlUYgwaeiE4bwJ8x5aZ3sMw==
X-Google-Smtp-Source: APXvYqzmosxGWn8Wmbx1xbpbu2T2xdxnMNKGmZ/GFgtcKn0ch9X8Q9mqiwmbZlp2M+ix53xh9Z6J1g19GsWwWc4eHo4=
X-Received: by 2002:a92:8f46:: with SMTP id j67mr4689765ild.125.1579028764945;
 Tue, 14 Jan 2020 11:06:04 -0800 (PST)
MIME-Version: 1.0
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 14 Jan 2020 19:07:12 +0100
Message-ID: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
Subject: Explore ideas on workflows improvements with Google Summer of Code
 mentoring program?
To:     workflows@vger.kernel.org
Cc:     Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Dear all,

Till Kamppeter and Aveek Basu organize the Google Summer of Code
student mentoring program in the name of the Linux Foundation. They
have set up a page for project ideas for the Linux Foundation's
participation in the linuxfoundation wiki:

https://wiki.linuxfoundation.org/gsoc/google-summer-code-2020

I believe many ideas discussed here on this list, e.g., extensions to
patchwork, public-inbox, further bots, scripts, etc., are well suited
to be prototyped or implemented by students in the GSoC program.

If you agree and have some good ideas, please add your ideas to this
currently still empty draft page:

https://wiki.linuxfoundation.org/gsoc/2020-gsoc-kernel-workflows

Ideas should be roughly described in five to six sentences, possibly
with a list of expectations on required knowledge a student should
show for its application. Within the application period later,
interested students have to write a much more extensive project
proposal as part of their application, by exchanging with the group to
refine the rough idea to a proper task and student project.

Please also take into account that the deadline for the application as
mentoring organization is Feb 5 and after that Google will evaluate
the applications. So have the ideas (at least most of them, ideas can
be posted up to the student application deadline) in by then to raise
chances to get accepted and get slots for students assigned.

If you have any questions concerning GSoC organisation, you can reach
out to Till, Aveek or me.

Best regards,

Lukas
