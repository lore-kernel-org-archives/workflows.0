Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA64C433FE
	for <workflows@archiver.kernel.org>; Sat,  1 Oct 2022 10:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiJAKkE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 1 Oct 2022 06:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJAKkC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 1 Oct 2022 06:40:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A3613F36;
        Sat,  1 Oct 2022 03:39:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA848B80DDA;
        Sat,  1 Oct 2022 10:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC8CC433D6;
        Sat,  1 Oct 2022 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664620792;
        bh=2REZi1DSBxW54qHDdDsCh+oVeTCZ/Q7nmWOxEnkFZN4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HyTcFygilfek7CPy21CK17wZu7YMs8hHhJb0TH91zkH0Qad2O0TsZvqtzZjpBh40N
         h5X8kavAnzlgshPMPl2+ovWVmO4XrRuAPcpwWITzXOWBV4wJNXlRZ1rOmFJA6aPLsQ
         Km+js0MRZ/A2VjRXmYIvlK1C0Lb8evSA4K0Q7e64=
Date:   Sat, 1 Oct 2022 12:39:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Artem S. Tashkinov" <aros@gmx.com>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzgY9X/DM9t/ZuJe@kroah.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, Oct 01, 2022 at 10:30:22AM +0000, Artem S. Tashkinov wrote:
> Here are two other issues which absolutely suck in terms of dealing with
> the kernel.
> 
> - 1 -
> 
> I have a 20+ years experience in IT and some kernel issues are just
> baffling in terms of trying to understand what to do about them.
> 
> Here's an example: https://bugzilla.kernel.org/show_bug.cgi?id=216274
> 
> What should I do about that? Who's responsible for this? Who should I CC?

Input subsystem.

> Here's what I'm getting with Linux 5.19.12:
> 
> platform wdat_wdt: failed to claim resource 5: [mem
> 0x00000000-0xffffffff7fffffff]

$ find . | grep wdat_wdt
./drivers/watchdog/wdat_wdt.c
$ ./scripts/get_maintainer.pl --file ./drivers/watchdog/wdat_wdt.c
Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE DRIVERS)
Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
linux-kernel@vger.kernel.org (open list)

> ACPI: watchdog: Device creation failed: -16
> ACPI BIOS Error (bug): Could not resolve symbol
> [\_SB.PCI0.XHC.RHUB.TPLD], AE_NOT_FOUND (20220331/psargs-330)
> ACPI Error: Aborting method \_SB.UBTC.CR01._PLD due to previous error
> (AE_NOT_FOUND) (20220331/psparse-529)

Send to ACPI list as described in the MAINTAINERS file.

thanks,

greg k-h
