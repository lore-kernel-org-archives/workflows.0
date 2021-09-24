Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29482C433F5
	for <workflows@archiver.kernel.org>; Fri, 24 Sep 2021 16:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08FB261212
	for <workflows@archiver.kernel.org>; Fri, 24 Sep 2021 16:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347176AbhIXQCu (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 24 Sep 2021 12:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27588 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347186AbhIXQCt (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 24 Sep 2021 12:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632499276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=bmcK+D1RaDI66D5z4jD0+zZ3XdZnFEDJmEeLnh8UUxk=;
        b=eTLYoPqspoxj+DHUcUbgSTWYVrcFQ1ESqfKjfW7hpoZ7sOVAdNRyJneasSUqvPitGj7s5b
        r/QKar1/Qc1+aFBt8FSMRDrYGr6GRnrqdxmYlmoYzvxrfW06whn7cLVQX3tUeA+MI2+xLx
        xmf2ugcZH4Gj/alz1o9eBcG4se+SUhY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-blV2wfXGOdKDDp22sLMoDQ-1; Fri, 24 Sep 2021 12:01:14 -0400
X-MC-Unique: blV2wfXGOdKDDp22sLMoDQ-1
Received: by mail-io1-f72.google.com with SMTP id j7-20020a0566022cc700b005d65f61a95fso3663369iow.9
        for <workflows@vger.kernel.org>; Fri, 24 Sep 2021 09:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bmcK+D1RaDI66D5z4jD0+zZ3XdZnFEDJmEeLnh8UUxk=;
        b=pynOjrLNimZgasDX3ObPMeNsVOF1f0aeUoxJGwu6q22yOo/sP+hvIYywLUplnKfq8b
         o03zZ088LSDAmTzSkUjaEOGObXGYQWN+iCZlPpllOKde8YvJEoLzIlouZjFcvylbnjdL
         iWzVq5JV+45CovoSayIvxc5ok4iarb67uyS1xuBf2NIymNxzX45aK6/iidEBpOQhiFgV
         Sgx7ZhgtRjmxxHgwQ1PhHl3KyxjBlPV+Dh9NLWrhK9MT/Q0njL2xjry4v0FrBDEficCu
         sHnVUMKSuOilRXFofSV7Myll/abqH0awZWFjgQlhTutEtTfQeC4qjlitcmUue8mKb8II
         bVTQ==
X-Gm-Message-State: AOAM5320FYCHBC9ko2IsWBuLCD/dK48SUeqZMPvron/imsCAADIayoCi
        W8IlxjlW2u27njgDWzy/vj8irTMJdAWNnGVHDYq2h2W9ueSpOWj2O5+1ltauDHXdi4PZYMdzxA5
        r60iU19cdOnalzULTaQARq9e4C1LCMab7a/zf
X-Received: by 2002:a05:6638:2050:: with SMTP id t16mr9874902jaj.101.1632499273925;
        Fri, 24 Sep 2021 09:01:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR0Ng0y5OKDSyc4DLkWlrurS9v0oOjyk4RlM3L/CKMKS7uA6fWBPYJRh3n186duca8BqBIgpSxet15uv+NjzQ=
X-Received: by 2002:a05:6638:2050:: with SMTP id t16mr9874886jaj.101.1632499273671;
 Fri, 24 Sep 2021 09:01:13 -0700 (PDT)
MIME-Version: 1.0
From:   Donald Zickus <dzickus@redhat.com>
Date:   Fri, 24 Sep 2021 12:01:02 -0400
Message-ID: <CAK18DXZXjjAJ4xWbaBuyExjninw3_ocRwtZ=dZhPJq3mqs0=sA@mail.gmail.com>
Subject: Email bridge for GitLab
To:     workflows@vger.kernel.org, konstantin@linuxfoundation.org,
        dja@axtens.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin, Daniel,

Thanks for the feedback on my GitLab talk yesterday.  Sorry I missed
the post talk discussion.

I know that creating a usable but distributed collaboration forum with
a forge (preferably email) is a challenging problem.

The problem presented:
How to collaborate across different forge based workflows or email
based workflows?
How to keep the entry bar low for contributors?
How to handle situations where the forge is down for a few hours, can
work still get done?

Most of the above problems indicate 'email' is the common method for
handling them.



I wanted to throw out the email bridge the Red Hat kernel developed
using Patchwork v2, celery and an http server as the core piece plus
added scripts glued together.  Considering kernel.org has a lot of
those pieces there, it might not be a stretch to implement this.

Anyway, throwing this out as a conversation starting solution:
patchlab (https://github.com/jeremycline/patchlab).  Thanks to Jeremy
Cline for thinking and implementing this!

How does it work?
(assuming a running instance of Patchwork and an http server)

Email -> GitLab
 * email sent to list and shows up on Patchwork as designed
 * Patchwork uses hook to call separate django DB table that maps PW
PatchID to GitLab MR
   * If not found, adds entry
   * kick off celery job
     * Comments use GitLab token to add comment to MR
     * New patches are applied locally in new branch and git push'd as new MR
     * Failed to apply patches are dropped
     * Updated patch updates MR

GitLab -> Email
  * GItLab updates will send webhooks to http server with Patchwork
    * comments convert GitLab MR to PW PatchID
      * use msgid and cc fields to send email reply
     * new MRs are cloned locally
       * git format-patch ; git-send-email
       * Add email header to avoid loop
       * Sent email circles around to populate Patchwork DB
         * extra email header will block further processing in above celery job

We have been running this publicly for almost a year now.
Email list : https://lists.fedoraproject.org/archives/list/kernel@lists.fedoraproject.org/
GitLab project: https://gitlab.com/cki-project/kernel-ark/-/merge_requests

I know this isn't the most simple or elegant solution, but it solved
our needs for now.  Happy to entertain better ideas or thoughts!

Thoughts?

Cheers,
Don

