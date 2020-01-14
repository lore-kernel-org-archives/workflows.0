Return-Path: <SRS0=QiH3=3D=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B24C33C9E
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 19:14:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8A3B222C4
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 19:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNorhSzE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgANTOC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 14:14:02 -0500
Received: from mail-il1-f177.google.com ([209.85.166.177]:33000 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgANTOA (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 14 Jan 2020 14:14:00 -0500
Received: by mail-il1-f177.google.com with SMTP id v15so12550322iln.0
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 11:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=hFa7vJOqH5ZYtAl3JMqWe+nNk7svu2GwB8iF38MwDP8=;
        b=ZNorhSzEkm9297roDcAwDSNZUcDStKvZLAsW2KBgzQL8ZLefPetICHVl89MjqrMMsH
         qXe99h0Q2gkXVUx8Q5eC0ETXq3MRVO4WeAYcajKCtO4CtLIBzcry1Sa35G6HTyiv9lns
         JiZ1tEXRRLtqC+cJdoBHcE4SxzLIQm9Toa7i64BcngHIeqhHdM4xHGXSYcVa58JQ5CBZ
         s5VeadTaagM22mSMkdtp+XVBRosVC3poiyvNWgWGWYyxnkaqXRrNh7sNgG+RmIJeUJVP
         UPkD7/k/iIjGLZOwT+HZ5pJqVU/psuqx3hBDIRvPVY7mz4CJckh2uQ1Pb967iDP9mntf
         86Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=hFa7vJOqH5ZYtAl3JMqWe+nNk7svu2GwB8iF38MwDP8=;
        b=MobyzYp9SDuoKnTJ0dH15YNFcNDfLxMJCSz3KNeWja8qW5HhWV4QgolVM2/kVcLFxp
         WIfLvAYKcbUZpPCP6EyqTQBX2Cx6oyUTxQoMTDgxDdVvwYP07liYgzVPzCmrAuETvZdy
         H/IejFBcG9SNbHEZZPIl2e9OAIUAlA0TrG/IRqRbVTC3OxUSx29j7CaG9CC9Z5PNgK9n
         16nf4fD+EkC3aeGWyHAIQlhUyyEhemU/WjSgrznbG16m/Z0HesZK/nGJUIzN5SThb4pg
         BouP7o5LlHB50aRivUrqQGL/eL0aO/7hi8KcjuYN2EAwK2Ls0XV+juZjfMKcpOiX65R3
         kE/Q==
X-Gm-Message-State: APjAAAVVFFUPJOabHpq/U9LSUuljhzhdDlMyr7c8FGdv5V0UUNqGwfw5
        DTXQSy9uVtlIfvw3ZjRYdCg6/zN/nwkPAXm7/mOeSky+
X-Google-Smtp-Source: APXvYqyTaPfyEfoOtrVahul0QyghYjELLlRmRgZ0hv+/6iFCKMKT0WkW1bwN/6UOYmUNNeZCBeFHCxIccQHSLhhyvRs=
X-Received: by 2002:a92:d7c6:: with SMTP id g6mr4251182ilq.37.1579029239754;
 Tue, 14 Jan 2020 11:13:59 -0800 (PST)
MIME-Version: 1.0
References: <87d0bmkx1w.fsf@linux.ibm.com> <BZVJY1FGBLDC.1FI35DM2QXOZT@homura>
In-Reply-To: <BZVJY1FGBLDC.1FI35DM2QXOZT@homura>
Reply-To: bjorn@helgaas.com
From:   Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date:   Tue, 14 Jan 2020 13:13:48 -0600
Message-ID: <CABhMZUUaEj7fme6OVa4sQmrUSYpumG-t-1KeACdFq-UDks5wdA@mail.gmail.com>
Subject: Re: matrix.org as a replacement for IRC?
To:     Drew DeVault <sir@cmpwn.com>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Jan 14, 2020 at 7:44 AM Drew DeVault <sir@cmpwn.com> wrote:
>
> Hard NACK from me.

I'd never heard of matrix.org and don't have an opinion either way.  I
do find IRC useful.  Proxies make it much more useful, and if I have a
choice, I'd rather not pay $50/year to irccloud just for a permanent
presence.

I'd be interested to hear the details of your NACK, because they'd
likely be informative and useful to me.

Bjorn
