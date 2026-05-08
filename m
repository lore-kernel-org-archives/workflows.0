Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8628C3890EA
	for <workflows@vger.kernel.org>; Fri,  8 May 2026 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778273539; cv=none; b=Sjf6k0HlKUsH1aHLxi/R0qiRWxAkZx+eVjU15yaYZs5Lu6caQeyGMx/K7WPjGFpvfvIvyqG86f/FbxmQaP2umJriO22PyM09gZw12jTPnDi30hBug4P9M2FW/jkHIPBafBrdRdMK4af63k52czN0EZz7ey2PvHWV4LM1+sEAF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778273539; c=relaxed/simple;
	bh=sYx5nIT8oor9Cqx7QoNH1O2kJWE8Ml0wYUcNXnPd33Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1OxCKMuTlVlvi+5w7oube7aOjY1+Gr7zbYocmk/6SnpV11NZ5Zqg9L2HYvw5ZUJ8pbKY6vf+KqVkDdVa1ZwjbmC4RMN1VhuGM50vm5cVGySwBmQwznIfa7WTpfqwB0j2cWEb1SahUGMmVF3knrK0h2pNVBF9y0/TB7R3F0jGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UGDt5AXj; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UGDt5AXj"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de4e6c5a30so2454036a34.0
        for <workflows@vger.kernel.org>; Fri, 08 May 2026 13:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778273535; x=1778878335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CLB5woreGeAT7AzJ04Kc/ouEhZjK0a76O38N1+hG4M=;
        b=UGDt5AXjXp40JGLqQqUznbZ9jmgZovQNfpx4FKgY+3AuPvUhN2vXJOrl4M0YF0NSM0
         a6zCR7rz4sDOWOgzD9z1+heHCl8/jnYeVJpcR3pW9zh9ahWNOAN0NyVIJLqs86TmPhYz
         LqFlCk2ABMXQNLckI8auvCkqBsERdLSCBvdz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273535; x=1778878335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CLB5woreGeAT7AzJ04Kc/ouEhZjK0a76O38N1+hG4M=;
        b=CtDfXbebyXkGGm3V2WngxPb2coM+gODG9qaHHAvM3SC+xyZhxxIZoSmrgZTWgDUNIJ
         nFQL7WRv8WGJqNLbSXIXJwai6q7aNIN6hlQ/rc9QHwdkE1xG+k2T4lI96w/OBkBC9Wh/
         uvE2Bc8LuD33nA/XvgCbuaqTy2i/OYnPrLiCZDQa5sx+1glBQ1gSrZ5QBk1buAd0Gzhm
         M8lTutuiUEgbYzfuAK8mGVqCbUuWWkFaSlLlGVa+c7nrDY8vuxQPmwZDatLOyO/D3h7J
         C8iDgxPo7Yc1aGrvpK0yOMmtvgfMh6vog9JGJtnkbhXVtlED18GJms36CY53cXWVCtIz
         tZfw==
X-Forwarded-Encrypted: i=1; AFNElJ8lvzMq5otnxfgGAFgEMJzN6jqYXPv4sNrOBa6aenFr5mfiepQRxAsC/H5VLTq3aEZe50Leyh5KLyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEX4aGSQKUrSFND5Ytq0tv/UW1sqcdDYNB8e3yQFbe3PBXS4oO
	UMPMUPp2XPBURCHwiHl2Pb67lgdL/zrqzZmpwpsQXDgUM2lkZHOqiqXHp+TkYX76RDI=
X-Gm-Gg: AeBDievqE7wwiGd4lyWT3Y0c/lUB0JP5d4IA92jRrCxhWXc4XT8iI3FYYV8dtQ12E7W
	0YmARGnt2TG2piV3jmvn6VDceCLpGxdUsl2vnUbCkyO/Xe8cEQwwmYNALRmgLlef3YoPMmTyT+s
	TpaqEz9DEm6yoYC0r3ZAfwWPTWORyrBdULrF8ER23ZJsbGrT4ul6y6Zfvw07C3ntDB/+hECoWIo
	a0uP2CA8pY8BjOCfYxRVUzXdBLTHODqGqQor5QG8XgPXS86aPOwy5k9aC7YVkeb4izUjQfVMFnS
	ptU+nscOdz2t+NpmU2Rmvt58y5fSQizuAVi6ZUSDa7QK13WTaUCiWjeiZwTbhfweGWf10ohPOHU
	k5JdfX0bmpnuiF+1XgY+M7Z5VUQPxTsKcw1ZT24Pf3SIcImvuTxfb9MBMBl9OCP89+sr6U1cAOe
	AGyxWSxYOKNM2emZsa2wxzPA6OjMAC33A=
X-Received: by 2002:a05:6830:921:b0:7d7:e844:7f4e with SMTP id 46e09a7af769-7e1df0c337amr8265266a34.22.1778273535289;
        Fri, 08 May 2026 13:52:15 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d9d788sm1701776a34.24.2026.05.08.13.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 13:52:14 -0700 (PDT)
Message-ID: <a3ca798c-40ad-4afb-9c6b-35d53430b6d0@linuxfoundation.org>
Date: Fri, 8 May 2026 14:52:13 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260503113506.5710-1-w@1wt.eu> <20260503113506.5710-3-w@1wt.eu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260503113506.5710-3-w@1wt.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/26 05:35, Willy Tarreau wrote:
> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation and ease decision on the reporter's side.
> 
> It defers the enumeration to a new file, threat-model.rst, that tries
> to enumerate various classes of issues that are and are not security
> bugs. This should permit to more easily update this file for various
> subsystem-specific rules without having to revisit the security bug
> reporting guide.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>   Documentation/process/index.rst         |   1 +
>   Documentation/process/security-bugs.rst |  28 +++
>   Documentation/process/threat-model.rst  | 231 ++++++++++++++++++++++++
>   3 files changed, 260 insertions(+)
>   create mode 100644 Documentation/process/threat-model.rst
> 
> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index dbd6ea16aca70..aa7c959a52b87 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -86,6 +86,7 @@ regressions and security problems.
>      debugging/index
>      handling-regressions
>      security-bugs
> +   threat-model
>      cve
>      embargoed-hardware-issues
>   
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index 6dc525858125e..3b44464dd9ba7 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -66,6 +66,34 @@ In addition, the following information are highly desirable:
>       the issue appear. It is useful to share them, as they can be helpful to
>       keep end users protected during the time it takes them to apply the fix.
>   
> +What qualifies as a security bug
> +--------------------------------
> +
> +It is important that most bugs are handled publicly so as to involve the widest
> +possible audience and find the best solution.  By nature, bugs that are handled
> +in closed discussions between a small set of participants are less likely to
> +produce the best possible fix (e.g., risk of missing valid use cases, limited
> +testing abilities).
> +
> +It turns out that the majority of the bugs reported via the security team are
> +just regular bugs that have been improperly qualified as security bugs due to
> +ignorance or misunderstanding of the Linux kernel's threat model described in

"lack of understanding" instead of ignorance?

> +Documentation/process/threat-model.rst, and ought to have been sent through
> +the normal channels described in Documentation/admin-guide/reporting-issues.rst
> +instead.
> +
> +The security list exists for urgent bugs that grant an attacker a capability
> +they are not supposed to have on a correctly configured production system, and
> +can be easily exploited, representing an imminent threat to many users.  Before
> +reporting, consider whether the issue actually crosses a trust boundary on such
> +a system.
> +
> +If you are unsure whether an issue qualifies, err on the side of reporting
> +privately: the security team would rather triage a borderline report than miss
> +a real vulnerability.  Reporting ordinary bugs to the security list, however,
> +does not make them move faster and consumes triage capacity that other reports
> +need.
> +
>   Identifying contacts
>   --------------------
>   
> diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
> new file mode 100644
> index 0000000000000..8cd46483cd8b5
> --- /dev/null
> +++ b/Documentation/process/threat-model.rst
> @@ -0,0 +1,231 @@
> +.. _threatmodel:
> +
> +The Linux Kernel threat model
> +=============================
> +
> +There are a lot of assumptions regarding what the kernel protects against and
> +what it does not protect against. These assumptions tend to cause confusion for

Could simply say "what it does not" or "what the kernel does and does not protect
against"

> +bug reports (:doc:`security-related ones <security-bugs>` vs
> +:doc:`non-security ones <../admin-guide/reporting-issues>`), and can complicate
> +security enforcement when the responsibilities for some boundaries is not clear
> +between the kernel, distros, administrators and users.
> +
> +This document tries to clarify the responsibilities of the kernel in this
> +domain.
> +
> +The kernel's responsibilities
> +-----------------------------
> +
> +The kernel abstracts access to local hardware resources and to remote systems
> +in a way that allows multiple local users to get a fair share of the available
> +resources granted to them, and, when the underlying hardware permits, to assign
> +a level of confidentiality to their communications and to the data they are
> +processing or storing.
> +
> +The kernel assumes that the underlying hardware behaves according to its
> +specifications. This includes the integrity of the CPU's instruction set, the
> +transparency of the branch prediction unit and the cache units, the consistency
> +of the Memory Management Unit (MMU), the isolation of DMA-capable peripherals
> +(e.g., via IOMMU), state transitions in controllers, ranges of values read from
> +registers, the respect of documented hardware limitations, etc.
> +
> +When hardware fails to maintain its specified isolation (e.g., CPU bugs,
> +side-channels, hardware response to unexpected inputs), the kernel will usually
> +attempt to implement reasonable mitigations. These are best-effort measures
> +intended to reduce the attack surface or elevate the cost of an attack within
> +the limits of the hardware's facilities; they do not constitute a
> +kernel-provided safety guarantee.
> +
> +Users always perform their activities under the authority of an administrator
> +who is able to grant or deny various types of permissions that may affect how
> +users benefit from available resources, or the level of confidentiality of
> +their activities. Administrators may also delegate all or part of their own
> +permissions to some users, particularly via capabilities but not only. All this
> +is performed via configuration (sysctl, file-system permissions etc).
> +
> +The Linux Kernel applies a certain collection of default settings that match
> +its threat model. Distros have their own threat model and will come with their
> +own configuration presets, that the administrator may have to adjust to better
> +suit their expectations (relax or restrict).
> +
> +By default, the Linux Kernel guarantees the following protections when running
> +on common processors featuring privilege levels and memory management units:
> +
> +* **User-based isolation**: an unprivileged user may restrict access to their
> +  own data from other unprivileged users running on the same system. This
> +  includes:
> +
> +  * stored data, via file system permissions
> +  * in-memory data (pages are not accessible by default to other users)
> +  * process activity (ptrace is not permitted to other users)
> +  * inter-process communication (other users may not observe data exchanged via
> +    UNIX domain sockets or other IPC mechanisms).
> +  * network communications within the same or with other systems
> +
> +* **Capability-based protection**:
> +
> +  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
> +    kernel's configuration, memory nor state, change other users' view of the
> +    file system layout, grant any user capabilities they do not have, nor
> +    affect the system's availability (shutdown, reboot, panic, hang, or making
> +    the system unresponsive via unbounded resource exhaustion).
> +  * users not having the ``CAP_NET_ADMIN`` capability may not alter the network
> +    configuration, intercept nor spoof network communications from other users
> +    nor systems.
> +  * users not having ``CAP_SYS_PTRACE`` may not observe other users' processes
> +    activities.
> +
> +When ``CONFIG_USER_NS`` is set, the kernel also permits unprivileged users to
> +create their own user namespace in which they have all capabilities, but with a
> +number of restrictions (they may not perform actions that have impacts on the
> +initial user namespace, such as changing time, loading modules or mounting
> +block devices). Please refer to ``user_namespaces(7)`` for more details, the
> +possibilities of user namespaces are not covered in this document.
> +
> +The kernel also offers a lot of troubleshooting and debugging facilities, which
> +can constitute attack vectors when placed in wrong hands. While some of them
> +are designed to be accessible to regular local users with a low risk (e.g.
> +kernel logs via ``/proc/kmsg``), some would expose enough information to
> +represent a risk in most places and the decision to expose them is under the
> +administrator's responsibility (perf events, traces), and others are not
> +designed to be accessed by non-privileged users (e.g. debugfs). Access to these
> +facilities by a user who has been explicitly granted permission by an
> +administrator does not constitute a security breach.
> +
> +Bugs that permit to violate the principles above constitute security breaches.
> +However, bugs that permit one violation only once another one was already
> +achieved are only weaknesses. The kernel applies a number of self-protection
> +measures whose purpose is to avoid crossing a security boundary when certain
> +classes of bugs are found, but a failure of these extra protections do not
> +constitute a vulnerability alone.
> +
> +What does not constitute a security bug
> +---------------------------------------
> +
> +In the Linux kernel's threat model, the following classes of problems are
> +**NOT** considered as Linux Kernel security bugs. However, when it is believed
> +that the kernel could do better, they should be reported, so that they can be
> +reviewed and fixed where reasonably possible, but they will be handled as any
> +regular bug:
> +
> +* **Configuration**:
> +
> +  * outdated kernels and particularly end-of-life branches are out of the scope
> +    of the kernel's threat model: administrators are responsible for keeping
> +    their system up to date. For a bug to qualify as a security bug, it must be
> +    demonstrated that it affects actively maintained versions.
> +
> +  * build-level: changes to the kernel configuration that are explicitly
> +    documented as lowering the security level (e.g. ``CONFIG_NOMMU``), or
> +    targeted at developers only.
> +
> +  * OS-level: changes to command line parameters, sysctls, filesystem
> +    permissions, user capabilities, exposure of privileged interfaces, that
> +    explicitly increase exposure by either offering non-default access to
> +    unprivileged users, or reduce the kernel's ability to enforce some
> +    protections or mitigations. Example: write access to procfs or debugfs.
> +
> +  * issues triggered only when using features intended for development or
> +    debugging (e.g., lockdep, KASAN, fault-injection): these features are known
> +    to introduce overhead and potential instability and are not intended for
> +    production use.

Can we call out features and tools (the ones in kernel repo)

sched_ext's Kconfig enables
a few debug options including LOCKDEP

tools/sched_ext/Kconfig:CONFIG_DEBUG_LOCKDEP=y

> +
> +  * loading of explicitly insecure/broken/staging modules, and generally any
> +    using any subsystem marked as experimental or not intended for production
> +    use.
> +
> +  * running out-of-tree modules or unofficial kernel forks; these should be
> +    reported to the relevant vendor.
> +
> +* **Excess of initial privileges**:
> +
> +  * actions performed by a user already possessing the privileges required to
> +    perform that action or modify that state (e.g. ``CAP_SYS_ADMIN``,
> +    ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``, ``CAP_SYS_MODULE`` with no further
> +    boundary being crossed).
> +
> +  * actions performed in user namespace without permitting anything in the
> +    initial namespace that was not already permitted to the same user there.

This was a bit hard to parse - examples might help here

> +
> +  * anything performed by the root user in the initial namespace (e.g. kernel
> +    oops when writing to a privileged device).
> +
> +* **Out of production use**:
> +
> +  This covers theoretical/probabilistic attacks that rely on laboratory
> +  conditions with zero system noise, or those requiring an unrealistic number
> +  of attempts (e.g., billions of trials) that would be detected by standard
> +  system monitoring long before success, such as:
> +
> +  * prediction of random numbers that only works in a totally silent
> +    environment (such as IP ID, TCP ports or sequence numbers that can only be
> +    guessed in a lab).
> +
> +  * activity observation and information leaks based on probabilistic
> +    approaches that are prone to measurement noise and not realistically
> +    reproducible on a production system.
> +
> +  * issues that can only be triggered by heavy attacks (e.g. brute force) whose
> +    impact on the system makes it unlikely or impossible to remain undetected
> +    before they succeed (e.g. consuming all memory before succeeding).
> +
> +  * problems seen only under development simulators, emulators, or combinations
> +    that do not exist on real systems at the time of reporting (issues
> +    involving tens of millions of threads, tens of thousands of CPUs,
> +    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds.
> +
> +  * issues whose reproduction requires hardware modification or emulation,
> +    including fake USB devices that pretend to be another one.
> +
> +  * as well as issues that can be triggered at a cost that is orders of
> +    magnitude higher than the expected benefits (e.g. fully functional keyboard
> +    emulator only to retrieve 7 uninitialized bytes in a structure, or
> +    brute-force method involving millions of connection attempts to guess a
> +    port number).

Can we add a section about problems found using experimental or tools
in development stage?

> +
> +* **Hardening failures**:
> +
> +  * ability to bypass some of the kernel's hardening measures with no
> +    demonstrable exploit path (e.g. ASLR bypass, events timing or probing with
> +    no demonstrable consequence). These are just weaknesses, not
> +    vulnerabilities.
> +
> +  * missing argument checks and failure to report certain errors with no
> +    immediate consequence.
> +
> +* **Random information leaks**:
> +
> +  This concerns information leaks of small data parts that happen to be there
> +  and that cannot be chosen by the attacker, or face access restrictions:
> +
> +  * structure padding reported by syscalls or other interfaces.
> +
> +  * identifiers, partial data, non-terminated strings reported in error
> +    messages.
> +
> +  * Leaks of kernel memory addresses/pointers do not constitute an immediately
> +    exploitable vector and are not security bugs, though they must be reported
> +    and fixed.
> +
> +* **Crafted file system images**:
> +
> +  * bugs triggered by mounting a corrupted or maliciously crafted file system
> +    image are generally not security bugs, as the kernel assumes the underlying
> +    storage media is under the administrator's control, unless the filesystem
> +    driver is specifically documented as being hardened against untrusted media.
> +
> +  * issues that are resolved, mitigated, or detected by running a filesystem
> +    consistency check (fsck) on the image prior to mounting.
> +
> +* **Physical access**:
> +
> +  Issues that require physical access to the machine, hardware modification, or
> +  the use of specialized hardware (e.g., logic analyzers, DMA-attack tools over
> +  PCI-E/Thunderbolt) are out of scope unless the system is explicitly
> +  configured with technologies meant to defend against such attacks
> +  (e.g. IOMMU).
> +
> +* **Functional and performance regressions**:
> +
> +  Any issue that can be mitigated by setting proper permissions and limits
> +  doesn't qualify as a security bug.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

