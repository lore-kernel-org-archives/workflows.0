Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F68C4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 12:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58FC9217D7
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569585690;
	bh=yRgcyK85uA2XNFZZGosgJ4r8nXXwrXYfPoqnIcDPKgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=kA1NAZnpaJCdUzEmvaMwIa4hJuzaxOjAJkgbot7XKPS0VL1xTIgDBa/FqF8TQ+0Ee
	 Dop5KhRKjBrz9j2VlNNBU48HqOLuvMpowfK1VcIYKpLnDKxRF/PHDv+j9STEc5E+UX
	 Jg3V0UOCCkoJlkLbvkgHhy08Sf7nEY4aVVEpJo1I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfI0MBa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 08:01:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:58648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfI0MB3 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 27 Sep 2019 08:01:29 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1898821848
        for <workflows@vger.kernel.org>; Fri, 27 Sep 2019 12:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569585689;
        bh=yRgcyK85uA2XNFZZGosgJ4r8nXXwrXYfPoqnIcDPKgg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zPAhnr37emADsFY+ffpLp3BAsu9T2dHyDY9knW+useCteT5cpxelMsV274/xw1Ntf
         zp/mGKnAz54wZ03bH5GBqG/r64oiDRC6xcONvhRG5ZAacE64wZRLO976+FQwoRvHuY
         WgWpHZOaryLmYj6cahdaEi1EfL+utwI5BI2/kglQ=
Received: by mail-qt1-f172.google.com with SMTP id u22so6851022qtq.13
        for <workflows@vger.kernel.org>; Fri, 27 Sep 2019 05:01:29 -0700 (PDT)
X-Gm-Message-State: APjAAAUtU/ty0v4KynB7y9ctNYLcIzNd4Xi1i2+wWAqrjWR+I3r0Mi5j
        EARKkW6elagxzDczDa36wgpL0CWVpsM9VjG+tA==
X-Google-Smtp-Source: APXvYqxuZawtZ73q44qksTal2yX22UT3k8M7I2F/tJfHqzGA6/z6X7DvLnY5CUuuLWQt/Z8NlCXg4iKm1JME1gZuxik=
X-Received: by 2002:a0c:fa49:: with SMTP id k9mr7456412qvo.72.1569585688227;
 Fri, 27 Sep 2019 05:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190926195143.GA1742392@kroah.com> <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
In-Reply-To: <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 27 Sep 2019 07:01:17 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+emonMWUdz9jxnc3pnvpijK6CMLq-0dOStQWuHiEw3zA@mail.gmail.com>
Message-ID: <CAL_Jsq+emonMWUdz9jxnc3pnvpijK6CMLq-0dOStQWuHiEw3zA@mail.gmail.com>
Subject: Re: script to check "Fixes:" tags
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Sep 27, 2019 at 2:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Greg,
>
> On Thu, Sep 26, 2019 at 9:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > Since this list was created to share scripts, here's one that I
> > currently use to test that the "Fixes:" tags are correct on a commit.  I
> > run it on all patches that I accept into my trees, after getting emails
> > from Stephen one too many times :)
> >
> > It's almost entirely based on Stephen's original script, but has been
> > changed a bit in formatting and usage to be a stand-alone script that
> > anyone can use.
> >
> > To use:
> >         verify_fixes.sh GIT_RANGE
> >
> > if all is good, script will print nothing out and exit with success.  If
> > there is a problem it will be printed out and the script will exit with
> > an error that you can check from any other program.
> >
> > It it 'shellcheck' clean, but I'm sure that there are other things wrong
> > with it, so feel free to point out problems.
>
> Thanks!
>
> > And should stuff like this be in the kernel tree itself?
>
> Probably this should be integrated into checkpatch.pl?

I believe both checks already are.

I think we're looking at the problem the wrong way around. Stephen
shouldn't have to be checking this, and neither should maintainers. It
could be easily automated. We could have a checkpatch bot that runs
some subset of checkpatch checks we agree are always errors like the
ones here and replies to patches with the errors.

Rob
