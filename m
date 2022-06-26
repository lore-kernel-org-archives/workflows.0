Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0CDC433EF
	for <workflows@archiver.kernel.org>; Sun, 26 Jun 2022 10:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiFZKUJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 26 Jun 2022 06:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiFZKUI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 26 Jun 2022 06:20:08 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2AC120BB
        for <workflows@vger.kernel.org>; Sun, 26 Jun 2022 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656238806;
        bh=JawSD+wnehZeU7SuraNq+E4KPkiJSSTIeiokJhE6NN4=;
        h=X-UI-Sender-Class:Date:To:From:Subject;
        b=kGY5TbuEnHmZC6NAroqclJ7qS0ZKw7YnSyuTgyhzxkxQSclUQfomNySQqO/EKN9NG
         8ZiPk4exSEl1HwsGOcP5ZXhmk55IEC1u0UiMacirwt4Cue5oaUO8JxGKi+LVbjTsMD
         l0xFP9KD8IWsaTRBmrI7nvzxJlD3dNeoS0jd21AM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.102] ([46.5.231.21]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEUz4-1nqVwK1LvW-00G1ik for
 <workflows@vger.kernel.org>; Sun, 26 Jun 2022 12:20:06 +0200
Message-ID: <dde87559-5248-a8ef-e750-86bcfe2be9e7@gmx.de>
Date:   Sun, 26 Jun 2022 12:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To:     workflows@vger.kernel.org
Content-Language: en-US
From:   =?UTF-8?Q?Volker_Wei=c3=9fmann?= <volker.weissmann@gmx.de>
Subject: Script to see patches used in certain build configuration (from the
 google pixel devs?)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w4hB3heq5jpXYRAMSAT4RzckJ+6MZ14BWBv+CivJ+0AiKHh3EUo
 SP4WefSSinZmjn3htyiP5Lj7GC2GdVIp5yX2uGQem1BeLbdRNM6nnIAFc1fFUhY+08uttGC
 Zw6y7FqqJ4mFrlo7zEo+0jN9lfMyFWs47/diy46yW9zsRK9xCCE7zzCx+pJVtAKNvyUPCk/
 3FYWg8+uYYODkp5XHSIsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yk9KQXM+Kvc=:mi5MJmCif5haXiVTkEryd+
 VAbse/9mb8lOv9GxffuYlkz3ZpPgr7tKYKNVMG94E1aWwW5NEapKXI3fGKLwaf9lkU0Wf6Okd
 bKM71QMwuev/gHaGUG1uCccJNkoVC9mxZV9ogra6ndvAZ/tNQD+OHmpg6mMJYkU5cAqY4+Zke
 XR240FBogNIuOrljWTOZ33D+NqXgGm795qGJefIyFkGZCYyHH0cqRIo8tX36LI4M4x4sm7Sz6
 En0ufLzHMndPDguc4weWaGo8ivFQ6nj/ZPuZdgTD9juC7QKkpAP0wB7ezAaPhon0S13zc8y6c
 Cax2wKP4lcOyKRboMGB15kKBCh03XyUj9XX7GfGFzBGpC63PNFgWhlTFj0dkBcrN2wvEQTWZw
 tsXd6ImHguC4L+VatAtSt1+IJAXbCtKdmbqcqO0DYtOjz/JL0vJ/I8kmFtRVuKXcR5xwylRJ4
 N5B1Jv6D6omSkpioY/lglpVggAWDYfTYMws0qKLEoTDXht7BHR9Vtl1SBtQGwklQHszK1I7io
 pWTFKBl4R8Td+w1FcGu8HnIbwhMGtG26C74SD87S0RDox39kD3qZYn+tkgzivQten18v+vBH3
 +xXXAWl+YPJHjb/l126WF1fmym6/LKyh32fughpEvOPOZ2sFEM4fEMu0xdklLik3YOWhyDJ1U
 Ix3ydfs0MdRUrSycHTG4EB4CARpgP2TsnDjzdiurk2J3SmKC8e71iOqISRY+kZA41zJ5+st41
 DZdUY/qaEHSX0MpEh0Ss5l3vtmzDavvTGY9bT6KxoQne7u1TWASQAAWjHUXD7uwWg9zmw121Z
 FWU3FRor0WW4HcHi2gykIreFPo64EQrs49zkHJOVlh5UeRm+YCT0RHC095LWUNSjyv98SmWsa
 XOTlR7fOQVsbw+KieI23y+TO5hVvEd1wAnwQAFBHVtjGAyPROb2mkQoG5eYGs8jG+r9MG+nlx
 pTokyWJ3UGXpMUGRuJ0rGPlxSZGpXi1T2qwEDwgcjnJOJJjlXVAo5B21REix4CxThRPGuH7n2
 ErCLGXplm91EOA2hHzYP65td1jLeGoYG/4ymx+xPNGn3FfaIuTSq7WG0nLn1K3I6Xc3HSrhcB
 Mupf+xFTrQwJ4JJRMzbhbs0V1sPMSkFyUdQHPVe6WYGSVan7YU4nIqzpw==
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello,

Greg KH said in a talk [1]:

The google pixel phone has a script, that when they do a merge from an
LTS tree, they actually go through and they show you what patches
actually apply based on their build configuration.


Anyone knows where I can find this script?


[1] https://youtu.be/HeeoTE9jLjM?t=3D1524

