Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C0378803;
	Mon, 23 Feb 2026 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879926; cv=none; b=rTvTLJCC6aBDKOG/h0hX/nCZtwTSIze3Pc2ecwjqdlSstBFS6TtoPoAf49h+6d+KLRHWSCN1Tv9bpk3G9FjGkMdzikMKB3oWSgYQhQTue6xOjQB/7eZaFFVY3X4Ceimin1QrnWQIjRCkL8b8RSuL8J/OewHJp3/e1s1mRzPMykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879926; c=relaxed/simple;
	bh=3lXUh15JOstJaqUpNEzpUqXU7nNgd6pa2wMuKcauzGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNnFcZ8qGkwaX3bFxHOBY5j66vBsyEL6NzgMjgw3cyLTXBCimpTyJb0g+MDHq5LTJuVi80/r9CbkGhhJYW5hA39USL/RajPjnyrXGyctkWmo14aRAZb1XZZTQQHKIzNoTM1BtIY0dkGXCs9B0LM1RlI+mR/cucpT90/sR8ssMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3G8UL8K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3G8UL8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771879923; x=1803415923;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3lXUh15JOstJaqUpNEzpUqXU7nNgd6pa2wMuKcauzGI=;
  b=E3G8UL8KEWO9NeCd4UVf/Z20KGV6pDWeA0MR0tQguvq9xyeZIaVBL/zF
   aEHSV7LpdqpFZwKvEfjIdoGjDeYsXPAIafVhHd+U++U5ev+EV2O9URV24
   /IWlW3JXLbTC1s7yTggHeadbLfbjpAMkaEX6x98WZ2QHozq7p5i8CCQz5
   v1OR82zvAoF0DWwvDgPhUb4NIxVP0p1GDFm87+rTktLbCbRoEt9YxEizG
   IAkeReAkjmfulNddSpA6p4WZwyEGTe/OMORqC4MxsZ8UKg2IIwdu+TJBb
   jWxO8Vx48i1UyZ+s+A+Pr82BcBofBIPAyZ2TRwJXIj9keRkiXQouOJG3b
   g==;
X-CSE-ConnectionGUID: e36CngbCQ2iKJsm1Xp7VvQ==
X-CSE-MsgGUID: CMLwijGpT9+mEdcVhUdS4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83980235"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="83980235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 12:52:02 -0800
X-CSE-ConnectionGUID: NooiaZNuTSOdYiDTBibKsw==
X-CSE-MsgGUID: t7nZygSSR7+itl71V99Vxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215529661"
Received: from unknown (HELO [10.24.81.147]) ([10.24.81.147])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 12:52:01 -0800
Message-ID: <f25c328f-4ce7-4494-a200-af4ba928e724@intel.com>
Date: Mon, 23 Feb 2026 12:52:03 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/13] x86/kasan: Make software tag-based kasan
 available
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kasan-dev@googlegroups.com, workflows@vger.kernel.org
References: <cover.1770232424.git.m.wieczorretman@pm.me>
 <8fd6275f980b90c62ddcb58cfbc78796c9fa7740.1770232424.git.m.wieczorretman@pm.me>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <8fd6275f980b90c62ddcb58cfbc78796c9fa7740.1770232424.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

...
> diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/x86_64/mm.rst
> index a6cf05d51bd8..7e2e4c5fa661 100644
> --- a/Documentation/arch/x86/x86_64/mm.rst
> +++ b/Documentation/arch/x86/x86_64/mm.rst
> @@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
>     ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unused hole
>     ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual memory map (vmemmap_base)
>     ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unused hole
> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN shadow memory (software tag-based mode)
>    __________________|____________|__________________|_________|____________________________________________________________
>                                                                |
>                                                                | Identical layout to the 56-bit one from here on:
> @@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
>     ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused hole
>     ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual memory map (vmemmap_base)
>     ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused hole
> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory
> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN shadow memory (software tag-based mode)
>    __________________|____________|__________________|_________|____________________________________________________________

I think the idea of these is that you can run through, find *one* range
and know what a given address maps to. This adds overlapping ranges.
Could you make it clear that part of the area is "generic mode" only and
the other part is for generic mode and for "software tag-based mode"?

> @@ -176,5 +178,9 @@ Be very careful vs. KASLR when changing anything here. The KASLR address
>  range must not overlap with anything except the KASAN shadow area, which is
>  correct as KASAN disables KASLR.
>  
> +The 'KASAN shadow memory (generic mode)/(software tag-based mode)' ranges are
> +mutually exclusive and depend on which KASAN setting is chosen:
> +CONFIG_KASAN_GENERIC or CONFIG_KASAN_SW_TAGS.
> +
>  For both 4- and 5-level layouts, the KSTACK_ERASE_POISON value in the last 2MB
>  hole: ffffffffffff4111
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index 64dbf8b308bd..03b508ebe673 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -22,8 +22,8 @@ architectures, but it has significant performance and memory overheads.
>  
>  Software Tag-Based KASAN or SW_TAGS KASAN, enabled with CONFIG_KASAN_SW_TAGS,
>  can be used for both debugging and dogfood testing, similar to userspace HWASan.
> -This mode is only supported for arm64, but its moderate memory overhead allows
> -using it for testing on memory-restricted devices with real workloads.
> +This mode is only supported for arm64 and x86, but its moderate memory overhead
> +allows using it for testing on memory-restricted devices with real workloads.
>  
>  Hardware Tag-Based KASAN or HW_TAGS KASAN, enabled with CONFIG_KASAN_HW_TAGS,
>  is the mode intended to be used as an in-field memory bug detector or as a
> @@ -351,10 +351,12 @@ Software Tag-Based KASAN
>  Software Tag-Based KASAN uses a software memory tagging approach to checking
>  access validity. It is currently only implemented for the arm64 architecture.
>  
> -Software Tag-Based KASAN uses the Top Byte Ignore (TBI) feature of arm64 CPUs
> -to store a pointer tag in the top byte of kernel pointers. It uses shadow memory
> -to store memory tags associated with each 16-byte memory cell (therefore, it
> -dedicates 1/16th of the kernel memory for shadow memory).
> +Software Tag-Based KASAN uses the Top Byte Ignore (TBI) feature of arm64 CPUs to
> +store a pointer tag in the top byte of kernel pointers. Analogously to TBI on
> +x86 CPUs Linear Address Masking (LAM) feature is used and the pointer tag is
> +stored in four bits of the kernel pointer's top byte. Software Tag-Based mode
> +uses shadow memory to store memory tags associated with each 16-byte memory cell
> +(therefore, it dedicates 1/16th of the kernel memory for shadow memory).

This is going to get really cumbersome really fast if all the
architectures doing this add their marketing terms in here.

	Software Tag-Based KASAN uses the hardware CPU features* to
	repurpose space inside kernel pointers to store pointer tags.
	...

and then _elsewhere_ you can describe the two implementations.

>  On each memory allocation, Software Tag-Based KASAN generates a random tag, tags
>  the allocated memory with this tag, and embeds the same tag into the returned
> @@ -370,12 +372,14 @@ Software Tag-Based KASAN also has two instrumentation modes (outline, which
>  emits callbacks to check memory accesses; and inline, which performs the shadow
>  memory checks inline). With outline instrumentation mode, a bug report is
>  printed from the function that performs the access check. With inline
> -instrumentation, a ``brk`` instruction is emitted by the compiler, and a
> -dedicated ``brk`` handler is used to print bug reports.
> -
> -Software Tag-Based KASAN uses 0xFF as a match-all pointer tag (accesses through
> -pointers with the 0xFF pointer tag are not checked). The value 0xFE is currently
> -reserved to tag freed memory regions.
> +instrumentation, arm64's implementation uses the ``brk`` instruction emitted by
> +the compiler, and a dedicated ``brk`` handler is used to print bug reports. On
> +x86 inline mode doesn't work yet due to missing compiler support.
> +
> +For arm64 Software Tag-Based KASAN uses 0xFF as a match-all pointer tag
> +(accesses through pointers with the 0xFF pointer tag are not checked). The value
> +0xFE is currently reserved to tag freed memory regions. On x86 the same tags
> +take on 0xF and 0xE respectively.

I think this would be more clear with a table or list of features and
supported architectures.

>  Hardware Tag-Based KASAN
>  ~~~~~~~~~~~~~~~~~~~~~~~~
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 80527299f859..877668cd5deb 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -67,6 +67,7 @@ config X86
>  	select ARCH_CLOCKSOURCE_INIT
>  	select ARCH_CONFIGURES_CPU_MITIGATIONS
>  	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
> +	select ARCH_DISABLE_KASAN_INLINE	if X86_64 && KASAN_SW_TAGS
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
>  	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
> @@ -196,6 +197,8 @@ config X86
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_KASAN			if X86_64
>  	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
> +	select HAVE_ARCH_KASAN_SW_TAGS		if ADDRESS_MASKING && CC_IS_CLANG
> +	select ARCH_NEEDS_DEFER_KASAN		if ADDRESS_MASKING
>  	select HAVE_ARCH_KFENCE
>  	select HAVE_ARCH_KMSAN			if X86_64
>  	select HAVE_ARCH_KGDB
> @@ -410,6 +413,7 @@ config AUDIT_ARCH
>  config KASAN_SHADOW_OFFSET
>  	hex
>  	depends on KASAN
> +	default 0xeffffc0000000000 if KASAN_SW_TAGS
>  	default 0xdffffc0000000000

Please separate this from the documentation.

>  config HAVE_INTEL_TXT
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index fd855e32c9b9..ba70036c2abd 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -13,6 +13,7 @@
>  #undef CONFIG_PARAVIRT_SPINLOCKS
>  #undef CONFIG_KASAN
>  #undef CONFIG_KASAN_GENERIC
> +#undef CONFIG_KASAN_SW_TAGS
>  
>  #define __NO_FORTIFY
>  
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 90c18e30848f..53ab7de16517 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -6,7 +6,12 @@
>  #include <linux/kasan-tags.h>
>  #include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define KASAN_SHADOW_SCALE_SHIFT 4
> +#else
>  #define KASAN_SHADOW_SCALE_SHIFT 3
> +#endif
>  
>  /*
>   * Compiler uses shadow offset assuming that addresses start
> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
> index 7f5c11328ec1..8cbb8ec32061 100644
> --- a/arch/x86/mm/kasan_init_64.c
> +++ b/arch/x86/mm/kasan_init_64.c
> @@ -465,4 +465,9 @@ void __init kasan_init(void)
>  
>  	init_task.kasan_depth = 0;
>  	kasan_init_generic();
> +
> +	if (cpu_feature_enabled(X86_FEATURE_LAM))
> +		kasan_init_sw_tags();
> +	else
> +		pr_info("KernelAddressSanitizer not initialized (sw-tags): hardware doesn't support LAM\n");
>  }
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index a4bb610a7a6f..d13ea8da7bfd 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -112,7 +112,8 @@ config KASAN_SW_TAGS
>  
>  	  Requires GCC 11+ or Clang.
>  
> -	  Supported only on arm64 CPUs and relies on Top Byte Ignore.
> +	  Supported on arm64 CPUs that support Top Byte Ignore and on x86 CPUs
> +	  that support Linear Address Masking.

Can this read more like:

	Supported on:
		arm64: CPUs with Top Byte Ignore
		x86:   CPUs with Linear Address Masking.

please?
