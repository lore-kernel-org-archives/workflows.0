Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951C3430BA4;
	Mon,  2 Mar 2026 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772476220; cv=none; b=Mo9j82SuVwxJyv8/Pibaabl0FX5o4C99OML1DZUgMQcoLRGJNszUOsn3MY1i273rRjlYBq5tPHOa4ekcm0H1zZx6Vzc0vgPc5zChuUg1g/nVbj/JN5ZqepUOQElXZIGOKST3D7DQZ9s1kxjOYxriTW+FdoOeiurDFVj0GRTNHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772476220; c=relaxed/simple;
	bh=CgUr0xPXDPrkVtkerkZyHM8xMHWQa+AEgHe2Xkp9aqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGuYb3bZqsZ9cy9prEVTxooOjTziIRn2+kPUWUE5RYjWV6oixwOlADHDFlApEAH6k3M8JsG3g5DggtfEYkUDv/Lxhs12/GoVor/zdYFzC1YNimQP458U3tpQ9fHk5Y/BSW9Rza+xqQlp2hLfrSNdkiJeiTm5ryciGq+iwoe4Ewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=Z3Ng2SBD; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="Z3Ng2SBD"
From: Manuel Ebner <manuelebner@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1772475892; bh=CgUr0xPXDPrkVtkerkZyHM8xMHWQa+AEgHe2Xkp9aqc=;
	h=From:To:Cc:Subject:Date:From;
	b=Z3Ng2SBDz0pHJ53b/FRuO8/+tdS/A3L4Y2ql4O2iCX9RQy/sMZbRwa4kEkbz4urt5
	 tu9plCA+bhEW8oPy5zpoXkHOFZ86oSd8Z8Jp6JxpFBj7oPXP6AENKF5IQ2RbLO45Z4
	 h9N7eBR5jU3adBMbgRFCVr6k0gvsaA+L7ffVMXlsDGSQ4teCP5UdnRmm6D0Kj7otof
	 ynzeIARNpNq+JcBQTROfCH2Z9XHZVShjYLSNtWMVpodrYt49bAGZQlVnl9RBt/WKlP
	 HxNAJxdnfOyvAtbcDo+LeyCV/eLu7/uAz1Nj4M6Mgn6Uwg61kTB3oPXefAx82zuY/M
	 lJ3EUVh2CMIAQ==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Ebner <manuelebner@airmail.cc>
Subject: [PATCH v3 0/2] workflow, scripts: sort changes.rst and ver_linux
Date: Mon,  2 Mar 2026 19:24:06 +0100
Message-ID: <20260302182405.86829-2-manuelebner@airmail.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a pain in the ass to compare the software versions on the running
system (scripts/ver_linux) with the minimal required versions (changes.rst).
Sorting both lists the same way makes side-by-side comparisons a simple task.

 [v2] -> [v3]:
fix changelog
changes.rst:
 needn't -> do not need to
 add gdb 7.2
ver_linux:
 /Changes.rst -> /changes.rst
 add gdb

 [v1] -> [v2]:
split v1 into a patch series
changes.rst:
 add reference to ver_linux
ver_linux:
 fix path to changes.rst

Signed-off-by: Manuel Ebner <manuelebner@airmail.cc>
