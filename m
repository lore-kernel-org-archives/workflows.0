Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773201;
	b=mj5VbHjUALZOZSVuVVilsZntUiqnALPIKJjvYMJl0v1521k7dzts0xwgrKTpUJb5kuYh
	 izQIjHENz0ZAgRVGoYDGEWyQIMSdtrjt1HFBa39VwRRJ/Tb6qOneVer8Bfyzfv28TypIR
	 mNrmUZxEPs4LnLRTwZa1M8g91eHLHEPwVIYLRnv6UCXmojj3/6idqEP8Slc9reNiW2kLu
	 LCyr8mO21VEP5KFj4uj8a9Oz6MZE8tPYWC14eMA1+n3Y9MsjbwO0BbTEUK9bZDQHT98i6
	 3jK7jD1K9a5d/HcTV8WYTIei3XohC56RG2ADjY4/d1KCrJjOmeSDPrSYX5IQT+9hL+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+P/IoVdF17vz38ui1CJ5JK9XByo5JmBjc3ZsPBZRB90=;
	b=MEVLmsz8pWKfrgkf4rm92OTmHanSnerCrlAxbTEIGIW6T0TVwPkQr/f/RKhdfcCHFWWN
	 UhUW+ZzvisTv6XkYIGhqLBrmeVW4vtvpHb8/WVk0Kz33WVzEy6OYOoJqWYniW/h1yO4Fn
	 YOE1fdDEoWy/UhUQriBoM57cmeQnJXtmgSNKL7KXgmTyFFeJXrOCvzLVh29hC+whIVwB0
	 Qo3rEFbiT3Nocr+RK3/btaK/z88bAjqiVGUiKVRLRoDPE1NjwTcwRMYfa1Q3hGYwwj8qU
	 aGDxoZwxTjA8B6eKITXTQdv1A+uuiWfi/W11pOq7OpShbQxGFJdrQAKo40tcPdXwTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=am2ew+ad;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44899606A337
	for <workflows@vger.kernel.org>; Fri, 27 Nov 2026 09:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44899606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=am2ew+ad
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d427836e9so1038448066b.1
        for <workflows@vger.kernel.org>; Fri, 27 Nov 2026 01:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795773200; x=1796378000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+P/IoVdF17vz38ui1CJ5JK9XByo5JmBjc3ZsPBZRB90=;
        b=am2ew+adeGPwvdANDgwJ0Zt8/OcWIILnS4VI1TmusqGtbJfikoILfV7ARlpiV4G77p
         9cUfa7J6zpGFBLg31fzojDTx9yvtJY7GyQyEQF1ztDUobtOk0eknkHn8DbDoCrBucKEe
         bLkkUFPzj9lgdIEP3HIoquJCs1MeURpxHodkuN/wJ3NmICKS/nFrdx+ANnWQXx2WWkB0
         IcCuSnlitPY8NDWVqx5L82P1VMaB/joGiAq3PGqPrcB1YRXDqESTwZHE01Wr3f+69W01
         SYxPrd1LW568jgZs5TdpDokliKalBd+Gdonm6uHuO9i+pcIAZxoKk7b236uOBnfzQEec
         MFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773200; x=1796378000;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+P/IoVdF17vz38ui1CJ5JK9XByo5JmBjc3ZsPBZRB90=;
        b=KaV3gFtDeupmoyI2rfi1XDP2DDWmgNUh9IIzT128Z8BlMhXhAoa0NVaV5Z23/IOmZk
         zy23cSXMWyePIdfNNYCYYm2vmlbXqFiCrEFASnIbSZNrMIUQHgaXDZh6SJIqbnHd1dlO
         9os699/4Ha39OFcZNVlESJM2ZcyZJL8cgtalNPse72+WLuCSYCfbtfa0TZaM2xKuX3lY
         tqq0sgFdLyF9Lhl9DP3pfzrioMGajl1DwOxbWPezgwsEYgF0JIhJRn9mmUAa4OQ4KVAU
         jbVWK+ug5jJNg621nYtNpHXPrKZ8KXsfzXRDnrn2Lergn53ah/FsmB3SSivwM/OjLYAV
         SnDw==
X-Forwarded-Encrypted: i=1; AL+hErH1mb3dszhEfLn7sFqoBInBBW6sAgGbfoX8BGJ8gobffVP3rs161H5TYul6tv8JMR8+w6Mc3hpsJ08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JUOBOn/DBRhJxv5OX/e3Vj/aTrV7m9b4+G1ZyLU8bRUqFJxxJ
	tuNiSSmGfxhzWLXXbnARIfIBFhi0759eGP9ptRS+hLv6eOr4/7KxI4QBthymCiTKXpE=
X-Gm-Gg: AZFdTZeliSB2QO3Roxq3R2fwLtXEKYzZx+rcd4VNXMnGBf+wTStKXB7DPuskt+X00po
	u1kXlwpBLu2MwwpAEoFBU0R9OFmHEkQmvIQ2TBoNKdsu6CfDRLxQFXKDXvEamx3CF0SsFXiSuRD
	GghCF2IoR+pimQD9cqc76wDUSn47jXohMo/cPCCsh8ES7+eZvCSFEEH6rP2ZRW84mdNWMrLpLWw
	cJOzSF9nsvM6pFfIUgV6NrfeTm8DiNZzTORXWhEvyCDsyO41IpiB3vJMLOYSUxOfCd0LOVYp4D7
	ugxdSGH1GXDHsMC7ZjnG6yvMHHzvkPZJB/nLM2/37k4n9g/PuRlKBGZN4eZiYavNn+JFnIsAR8n
	7j3L2Rz8kEtpYuSo8CGIzrbO0ld6arDVhmqCdMLJKjlM0awRJ1mH4EO3mV5xmkkl71mnJDkq2pR
	OVYYelF7dqQTxPz/VdOR/Px9YuIWr/YmrGNEh+O4hnaCixJOFydDdntVi8T+l7fmEOd2D/odR90
	nKhp7rux7mNTibc13vJK6rqKLXKwoMRbOzBZc00N41VT2OQcSdFUvY7ykAbphCseiTK0FBcAeJY
	6a8CO4SMgn1y4GvD7ysz/wfMLtHOkYKjKoWnWhjcA7Y=
X-Received: by 2002:a17:907:1b0b:b0:c51:e06a:4744 with SMTP id a640c23a62f3a-c51e06a478emr88319166b.7.1795773199448;
        Fri, 27 Nov 2026 01:53:19 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm11900316b3a.34.2026.11.27.01.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:53:18 -0800 (PST)
Message-ID: <978c5ae0-8cf2-47d4-8fb5-1d96896132be@suse.com>
Date: Fri, 27 Nov 2026 20:23:13 +1030
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: add a maintainer entry profile
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-btrfs@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <0037554862c0d9dce3ddafd1238347e4b16a5079.1795581896.git.wqu@suse.com>
 <20261126133712.GN774860@unreal>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261126133712.GN774860@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/27 00:07, Leon Romanovsky 写道:
> On Wed, Nov 25, 2026 at 03:16:21PM +1030, Qu Wenruo wrote:
>> This new file is mostly based on my personal preferences, focusing on
>> how to improve the human readability in the LLM era.
>>
>> The new file should also act as a guide for humans that want to be a
>> long term contributor to btrfs.
> 
> My previous comment still applies. Most of it is relevant to other
> subsystems as well, and some of the suggestions duplicate existing
> documentation.

One question is, I can't find a generic one, nor there is a generic 
entry inside the MAINTAINERS file.

If we're going to create a generic one, shouldn't we just update the 
existing docs like `Documentation/process/submitting-patches.rst` instead?

And to be honest, the current one is already a little LLM orient, 
lengthy and not well human reader friendly.


So what's the recommended next step?

Thanks,
Qu

> 
>>
>> Signed-off-by: Qu Wenruo <wqu@suse.com>
>> ---
>> Changelog:
>> RFC->v1:
>> - Use maintainer entry profile instead of agent.md
>>
>> - Further simplfy the content for human readers
>>
>> ---
>>   Documentation/process/maintainer-btrfs.rst | 154 +++++++++++++++++++++
>>   MAINTAINERS                                |   2 +
>>   2 files changed, 156 insertions(+)
>>   create mode 100644 Documentation/process/maintainer-btrfs.rst
>>
>> diff --git a/Documentation/process/maintainer-btrfs.rst b/Documentation/process/maintainer-btrfs.rst
>> new file mode 100644
>> index 000000000000..5170dd73e655
>> --- /dev/null
>> +++ b/Documentation/process/maintainer-btrfs.rst
>> @@ -0,0 +1,154 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Btrfs patch guidelines
>> +======================
>> +
>> +Human readability comes first. A reviewer should be able to understand the
>> +problem and the fix from the message and code.
>> +
>> +Bloated LLM-generated information only wastes precious human time, no matter
>> +whether it is in a comment or a commit message.
> 
> This is general.
> 
>> +
>> +Code comments
>> +-------------
>> +
>> +* **Necessary comment only**
>> +
>> +  Comment is for things that are not obvious by itself, e.g. a locking
>> +  rule, an ordering requirement or a non-trivial reason for a workaround.
>> +
>> +  Keep the comment short if possible.
>> +
>> +  Don't repeat what the code does.
> 
> General too.
> 
>> +
>> +* **Add kernel-doc only for complex and/or exported functions**
>> +
>> +  If the function and parameter names are self-explaining, don't waste words
>> +  on the kernel-doc.
> 
> This is applicable to many subsystems, but probably not general.
> 
>> +
>> +Commit messages and cover letters
>> +---------------------------------
>> +
>> +* **Keep it simple**
>> +
>> +  Use short and simple sentences, avoid long paragraphs.
>> +
>> +  Simple patch for simple bug. Don't write a full [BUG] [CAUSE] [FIX] analysis
>> +  for something like a simple error handling enhancement.
>> +
>> +  And we don't care how you or your LLM found the bug unless it's hit in the
>> +  real world, so don't put such information even after the "---" line.
> 
> General
> 
>> +
>> +* **Prefer visual aids over long sentences**
>> +
>> +  See "Visual aids" section below.
> 
> General
> 
>> +
>> +* **Follow the style of well-known btrfs developers**
>> +
>> +  Check ``git log -- fs/btrfs`` for recent examples before drafting.
> 
> General
> 
>> +
>> +Visual aids
>> +-----------
>> +
>> +Prefer visual aids like an ASCII chart over words, e.g.:
>> +
>> +* A race. Show the race window, do not describe it in prose only.
>> +* An error handling bug in a function, seen from several call sites.
>> +* A call chain across layers, where the bug only shows on a certain path.
>> +
>> +Example, a race::
>> +
>> +   CPU0 (endio)                       CPU1 (fsync)
>> +   end_bbio_data_write()
>> +   |-btrfs_folio_clear_writeback()
>> +   |                                  btrfs_sync_file()
>> +   |                                  |-filemap_fdatawait_range()
>> +   |                                  | Returns after writeback finished
>> +   |                                  |
>> +   |                                  \-test_and_clear_bit(COW_WRITE_ERROR)
>> +   |                                    Still 0, skips waiting
>> +   \-set_bit(COW_WRITE_ERROR)
>> +     Too late.
>> +
>> +Example, an error handling bug, from commit c9583ada8cc4. The callee cleans up
>> +on error, then the caller cleans up again::
>> +
>> +   btrfs_do_readpage()
>> +   |-submit_extent_page()
>> +   | \-submit_one_bio()
>> +   |   \-btrfs_submit_data_bio()
>> +   |     \-bio_endio()
>> +   |       Calls end_page_read() and unlock_extent().
>> +   |
>> +   \-end_page_read() and unlock_extent()
>> +     Cleaned up again, the subpage reader count underflows.
> 
> General
> 
>> +
>> +Versioned patches
>> +-----------------
>> +
>> +* **Full history**
>> +
>> +  Include all versions, not only the changes of the last version.
> 
> General
> 
>> +
>> +* **Newest version first**
>> +
>> +  E.g.::
>> +
>> +    v3:
>> +    - Rename the helper to xxx()
>> +    - Add a missing lock in yyy()
>> +
>> +    v2:
>> +    - Fix the build failure on 32-bit
>> +
>> +* **Changelog location**
>> +
>> +  Put it in the cover letter for a patch series, or after the "---" line for
>> +  a single patch.
>> +
>> +  Don't put it in the commit message body.
> 
> General
> 
>> +
>> +Review
>> +------
>> +
>> +* **Follow the review**
>> +
>> +  Don't send a patch and just forget it. If you're not a well known developer,
>> +  it's uncommon to get merged on the first try.
>> +
>> +  One will need to communicate with the reviewers to get at least one review
>> +  from a well known btrfs developer, before getting the patch merged.
>> +
>> +* **Check Sashiko**
>> +
>> +  Sashiko posts AI-generated review for patches sent to the mailing list. The
>> +  btrfs list is at https://sashiko.dev/#/?list=org.kernel.vger.linux-btrfs
>> +
>> +  If a report is valid, address it in a newer version.
>> +
>> +  If a report is obviously wrong, it can be ignored. If the report is wrong but
>> +  the reason is not obvious, explaining it on the mailing list can help.
>> +
>> +Testing
>> +-------
>> +
>> +* **Run full fstests**
>> +
>> +  That's the main test suite we use.
>> +
>> +* **Testing procedures and results are only for complex patches**
>> +
>> +  Simple fixes shouldn't need a long paragraph on how to verify the fix.
>> +  Those simple fixes should be explained well by the commit message and code.
>> +
>> +  Bloated LLM-generated test procedures and results only waste human time.
>> +
>> +Before sending a patch
>> +----------------------
>> +
>> +* **Check the development branch**
>> +
>> +* **Check the mailing list**
>> +
>> +If your bug was found by an LLM, someone else may have already found, or even
>> +fixed, it.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 44540a1eb2b8..55f0b3dca133 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5838,9 +5838,11 @@ S:	Maintained
>>   W:	https://btrfs.readthedocs.io
>>   Q:	https://patchwork.kernel.org/project/linux-btrfs/list/
>>   C:	irc://irc.libera.chat/btrfs
>> +P:	Documentation/process/maintainer-btrfs.rst
>>   T:	git https://github.com/btrfs/linux.git for-next
>>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
>>   F:	Documentation/filesystems/btrfs.rst
>> +F:	Documentation/process/maintainer-btrfs.rst
>>   F:	fs/btrfs/
>>   F:	include/linux/btrfs*
>>   F:	include/trace/events/btrfs.h
>> -- 
>> 2.56.1
>>
>>

